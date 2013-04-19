Sequel.migration do 
  change do

    create_table :authors do
      primary_key :id
      text :name
      text :login_id
      timestamptz :created_at
      timestamptz :modified_at
    end

    create_table :blogs do
      primary_key :id
      text :title

      foreign_key :author_id, :authors

      timestamptz :created_at
      timestamptz :modified_at
    end

    create_table :posts do
      primary_key :id
      text :title
      text :body
      boolean :published

      foreign_key :blog_id, :blogs

      timestamptz :created_at
      timestamptz :modified_at
    end

  end
end

