class Blog < Sequel::Model
  many_to_one :author
  one_to_many :posts
end
