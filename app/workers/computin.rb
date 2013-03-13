class Computin
  include Sidekiq::Worker

  def perform
    # Don't be negative
    s = "-" * 1_000_000
    s.gsub!("-", "+")
    puts "Computed"
  end
end
