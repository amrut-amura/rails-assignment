class HiJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    puts "hi this is printed by the activejob."
    puts "company inspect  #{args.inspect}"
  end
end
