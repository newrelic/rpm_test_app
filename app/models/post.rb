class Post < ActiveRecord::Base
  belongs_to :blog
  scope :published, lambda { where(:published => true) }

  after_save do
    sleep 5
  end

  def evaluate
    # does nothing
  end
  
end
