# frozen_string_literal: true

# This class simply exposes several methods from Faker into a Helper available in views to return sample strings
module LoremHelper
  class StaticHelper < LoremHelper
    class << self
      def word
        'lorem'
      end

      def words(word_count = 3, _supplemental = false, start_index = 0)
        translate('faker.lorem.words')[resolve(start_index)...(resolve(start_index) + resolve(word_count))]
      end

      def character(start_index = 0)
        Faker::Lorem::CHARACTERS[start_index % Faker::Lorem::CHARACTERS.size]
      end

      def characters(char_count = 255)
        0.upto(resolve(char_count) - 1).collect { |i| character(i) }.join
      end

      def sentence(word_count = 4, supplemental = false, random_words_to_add = 6, start_index = 0)
        word_count += (random_words_to_add / 2).to_i
        words(word_count, supplemental, start_index).join(' ').capitalize + '.'
      end

      def sentences(sentence_count = 3, supplemental = false, start_index = 0)
        sentences = []
        (resolve(start_index)...(resolve(start_index) + resolve(sentence_count))).each do
          sentences << sentence(6, supplemental, 6, start_index)
          start_index += 6
        end
        sentences
      end

      def paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 4, start_index = 0)
        sentence_count += (random_sentences_to_add / 2).to_i
        sentences(resolve(sentence_count), supplemental, resolve(start_index)).join(' ')
      end

      def paragraphs(paragraph_count = 3, supplemental = false)
        paragraphs = []
        start_index = 0
        (0...resolve(paragraph_count)).each do
          paragraphs << paragraph(3, supplemental, 4, start_index)
          start_index += 30
        end
        paragraphs
      end

      def question(word_count = 4, supplemental = false, random_words_to_add = 6, start_index = 0)
        word_count += (random_words_to_add / 2).to_i
        words(word_count, supplemental, start_index).join(' ').capitalize + '?'
      end

      def questions(question_count = 3, supplemental = false, start_index = 0)
        questions = []
        (resolve(start_index)...(resolve(start_index) + resolve(question_count))).each do
          questions << question(6, supplemental, 6, start_index)
          start_index += 6
        end
        questions
      end

      def image(size = '300x300', format = 'png', background_color = nil, text_color = nil, text = nil)
        Faker::Placeholdit.image(size, format, background_color, text_color, text)
      end

      def email(name = 'example')
        name = name.downcase.strip.gsub(/[^\w]/, '.')
        "#{name}@example.com"
      end

      def name
        'John Smith'
      end

      def last_name
        'Smith'
      end

      def first_name
        'John'
      end

      def date
        Object::Date.new(2001, 2, 3)
      end
    end
  end
end
