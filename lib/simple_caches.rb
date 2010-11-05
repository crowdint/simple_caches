require 'active_record'
require 'simple_caches/simple_cache'

ActiveRecord::Base.send(:include, SimpleCaches)