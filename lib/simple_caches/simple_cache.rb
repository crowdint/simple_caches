module SimpleCaches
  module ClassMethods
    def simple_cache(target, source)
      define_method("cached_value_for_#{target}_#{source}") do
        self.send("#{target}=", self.send(source))
      end

      before_save do
        self.send("cached_value_for_#{target}_#{source}")
      end
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
  end
end