class Post < Sequel::Model
  many_to_one :blog

  dataset_module do
    subset( :published ) { :published }
  end

  def after_save
    sleep 5
  end

  def evaluate
    # does nothing
  end

end
