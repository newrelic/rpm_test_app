require 'rake/packagetask'

namespace :blog do
  desc "Run a background job"
  task :maintenance => :environment do
    include NewRelic::Agent::Instrumentation::ControllerInstrumentation
    NewRelic::Agent.manual_start :app_name => 'Blog Rake Tasks'
    sleep 20
    NewRelic::Control.instance.log.info "About to do a perform"
    perform_action_with_newrelic_trace :name=>'update_posts', :category=>:task do
      for post in Post.all do
        puts "Updating post #{post.id}: #{post.title}"
        post.body += "\nMaintenance at #{Time.now}"
        post.save!
      end
    end
    NewRelic::Control.instance.log.info "Finished my perform"
    NewRelic::Agent.shutdown
  end
end
