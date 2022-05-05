class ContactsMessageConsumer < ApplicationConsumer
  subscribes_to 'contacts_message'

  def process(message)
    REDIS.set(message.id, message)
    message = JSON.parse(message.value)
    puts message
  rescue JSON::ParserError => e
    puts "Failed to process message in #{message.topic}/#{message.partition} at offset #{message.offset}: #{e}"
  end
end
