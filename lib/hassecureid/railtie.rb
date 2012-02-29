require 'hassecureid'

module HasSecureId
  class Railtie < Rails::Railtie
    initializer 'hassecureid.insert_into_active_record' do
      ActiveSupport.on_load :active_record do
        HasSecureId::Railtie.insert
      end
    end

    def self.insert
      ActiveRecord::Base.send(:include, HasSecureId::Glue)
    end
  end
end
