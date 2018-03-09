# frozen_string_literal: true

# This class simply exposes several methods from Faker into a Helper available in views to return sample strings
module LoremHelper
  class Lorem < Faker::Lorem
    class << self
      def image(size = '300x300', format = 'png', background_color = nil, text_color = nil, text = nil)
        Faker::Placeholdit.image(size, format, background_color, text_color, text)
      end

      def email(name = nil)
        Faker::Internet.email(name)
      end

      def name
        Faker::Name.name
      end

      def last_name
        Faker::Name.last_name
      end

      def first_name
        Faker::Name.first_name
      end

      def title(word_count = 2)
        words(word_count).map(&:capitalize).join(' ')
      end

      def date
        Faker::Date.between(Object::Date.today - 20 * 365, Object::Date.today)
      end
    end
  end
end
