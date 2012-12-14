class Dummy
  @queue = :dummy
  
  def self.perform(*args)
    blogs = Blog.all
    puts "Loaded #{blogs.size} blogs"
  end
end
