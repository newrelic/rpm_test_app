#!/usr/bin/env ruby

# This is totally janky, but way easier than running sidekiq tests completely
# by hand, parsing timetamps manually, etc.
#
# The main issue is that sidekiq doesn't offer a good way to know when the queue
# has been emptied. We work around that in this script by parsing out timestamps
# from the sidekiq log file, and polling the log file at a low frequency to see
# when it stops growing for at least 5s, and assume that sidekiq is done at that
# point.

require 'fileutils'
require 'date'

njobs = 2000
concurrency = 1
environment = 'production'
base_path = '.'
job_type = 'Databasin'
log_path = File.join(base_path, 'log', 'sidekiq.log')
pidfile = File.join(base_path, 'sidekiq.pid')
queue_key = 'queue:default'

puts "Dropping queue #{queue_key}"
system("redis-cli del #{queue_key}")
puts "Removing pid file at #{pidfile}"
FileUtils.remove_file(pidfile) rescue nil
puts "Removing log file at #{log_path}"
FileUtils.remove_file(log_path) rescue nil

bundle = "bundle exec"

puts "Enqueueing #{njobs} jobs"
enqueue_cmd = "#{bundle} rails runner '#{njobs}.times { #{job_type}.perform_async }'"
puts enqueue_cmd
result = system(enqueue_cmd)
unless result
  puts "Enqueue command failed with exit status #{$?}"
  exit 1
end

sidekiq_cmd = "#{bundle} sidekiq -L #{log_path} -e #{environment} -c #{concurrency} -P #{pidfile}"
puts "Starting sidekiq: #{sidekiq_cmd}"
system("#{sidekiq_cmd} &")

sleep 20
sidekiq_pid = File.read(pidfile)
puts "Read PID #{sidekiq_pid}"

prev_size = 0
loop do
  log_size = File.size(log_path)
  puts "log_size: #{log_size}"
  break if prev_size == log_size
  sleep 5
  prev_size = log_size
end

puts "Done! Killing sidekiq"
system("sidekiqctl stop #{pidfile}")

start_regex = /(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z) \d+ .* start/
done_regex = /(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z) \d+ .* done: /

log_contents = File.read(log_path)
log_lines = log_contents.split("\n")

first_start_line = log_lines.find { |l| l.match(start_regex) }
start = DateTime.parse($1).to_time
last_done_line = log_lines.reverse.find { |l| l.match(done_regex) }
finish = DateTime.parse($1).to_time
duration = finish.to_i - start.to_i

puts "#{njobs} jobs, concurrency = #{concurrency}, #{duration}s, %.2f jobs/s" % (njobs.to_f / duration)
