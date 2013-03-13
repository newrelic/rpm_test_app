class Databasin
  include Sidekiq::Worker

  def perform
    puts "Found #{Blog.find(:all).count} blogs"
  end
end
