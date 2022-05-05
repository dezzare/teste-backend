class ContactsLogConsumer < ApplicationConsumer
  subscribes_to 'contacts_log'

  def process(message)
    REDIS.set(message.value.id, message.value)
    message_content = JSON.parse(message.value)
    puts message_content
  rescue JSON::ParserError => e
    puts "Failed to process message in #{message.topic}/#{message.partition} at offset #{message.offset}: #{e}"
  end
end
