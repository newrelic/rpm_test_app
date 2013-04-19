Sequel.migration do
  change do
    create_table(:authors) do
      primary_key :id
      column :name, "text"
      column :login_id, "text"
      column :created_at, "timestamp with time zone"
      column :modified_at, "timestamp with time zone"
    end
    
    create_table(:blogs) do
      primary_key :id
      column :title, "text"
      foreign_key :author_id, Sequel::SQL::QualifiedIdentifier.new(:public, :authors), :key=>[:id]
      column :created_at, "timestamp with time zone"
      column :modified_at, "timestamp with time zone"
    end
    
    create_table(:posts) do
      primary_key :id
      column :title, "text"
      column :body, "text"
      column :published, "boolean"
      foreign_key :blog_id, Sequel::SQL::QualifiedIdentifier.new(:public, :blogs), :key=>[:id]
      column :created_at, "timestamp with time zone"
      column :modified_at, "timestamp with time zone"
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
  end
end
