require 'securerandom'
require 'hassecureid/railtie'

module HasSecureId
  module Glue
    def self.included(base)
      base.extend ClassMethods
    end
  end

  module ClassMethods
    def has_secure_id
      include InstanceMethods
      attr_protected :secure_id
      before_create :initialize_secure_id
    end
  end

  module InstanceMethods
    private
    def initialize_secure_id
      # GUIDs are 128 bits. Should be good enough for us.
      # Using code based on
      # http://stackoverflow.com/questions/88311/how-best-to-generate-a-random-string-in-ruby
      bits_desired = 128
      characters = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
      number_of_characters = characters.length
      bits_of_randomness_per_character = Math.log(number_of_characters) / Math.log(2)
      rounds = (bits_desired.to_f / bits_of_randomness_per_character).ceil
      gen = ''

      rounds.times { gen << characters[SecureRandom.random_number(number_of_characters)] }

      self.secure_id = gen
    end
  end
end
