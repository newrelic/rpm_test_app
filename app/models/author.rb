class Author < Sequel::Model
  one_to_many :blogs
end
