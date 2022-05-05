REDIS_CONF = YAML.load_file(File.join(Rails.root, 'config/redis.yml'))[Rails.env]

Rails.application.config.cache_store = :redis_store, { host: REDIS_CONF['host'], port: REDIS_CONF['port'] }
Rails.cache = ActiveSupport::Cache.lookup_store(Rails.application.config.cache_store)

REDIS = Redis.new(host: REDIS_CONF['host'], port: REDIS_CONF['port'], db: 7)
