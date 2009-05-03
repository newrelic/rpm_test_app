class Post < ActiveRecord::Base
  belongs_to :blog
  named_scope :published, :conditions => {:published => true}
end
