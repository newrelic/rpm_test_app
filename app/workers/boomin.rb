class Boomin
  include Sidekiq::Worker

  sidekiq_options :retry => false

  def perform
    raise "THIS IS AN ERROR!"
  end
end
