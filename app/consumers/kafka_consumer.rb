class KafkaConsumer < Racecar::Consumer
  subscribes_to 'contacts_log'

  def initialize
    if @redis = Redis.new(host: '127.0.0.1', port: '6379')
      puts 'Conectado ao BD Redis'
    else
      puts 'volte ao inicio'
    end
  end

  def process(message)
    message_content = JSON.parse(message.value)
    puts message_content
  end
end
