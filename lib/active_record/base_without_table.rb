module ActiveRecord
  class BaseWithoutTable < Base
    self.abstract_class = true
    
    def create_or_update
      errors.empty?
    end
    
    class << self
      def columns()
        @columns ||= []
      end
      
      def column(name, sql_type = nil, default = nil, null = true)
        columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
      end
    end
  end
end
