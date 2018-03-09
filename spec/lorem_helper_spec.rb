# frozen_string_literal: true

RSpec.describe LoremHelper do
  it 'has a version number' do
    expect(LoremHelper::VERSION).not_to be nil
  end
end

RSpec.describe LoremHelper::Lorem do
  it 'generates a single word' do
    expect(LoremHelper::Lorem.word).to match(/^\w+$/)
  end

  it 'generates multiple words' do
    words = LoremHelper::Lorem.words(3)
    expect(words).to be_an Array
    expect(words.size).to eq 3
    words.each do |word|
      expect(word).to match(/^\w+$/)
    end
  end

  it 'generates a single character' do
    expect(LoremHelper::Lorem.character).to match(/^\w$/)
  end

  it 'generates multiple characters' do
    chars = LoremHelper::Lorem.characters
    expect(chars).to be_a String
    expect(chars.size).to eq 255
  end

  it 'generates multiple characters with custom count' do
    chars = LoremHelper::Lorem.characters(3)
    expect(chars).to be_a String
    expect(chars.size).to eq 3
  end

  it 'generates a single sentence' do
    # Default sentence is 4 - 10 words
    expect(LoremHelper::Lorem.sentence).to match(/^[A-Z][a-z]*( [a-z]+){3,9}\.$/)
  end

  it 'generates a single sentence with custom word count' do
    # Specify 12 words (plus 0-6 default random)
    expect(LoremHelper::Lorem.sentence(12)).to match(/^[A-Z][a-z]*( [a-z]+){11,17}\.$/)
  end

  it 'generates a single sentence with custom word count and custom random' do
    # Specify 12 words (plus 0 random)
    expect(LoremHelper::Lorem.sentence(12, false, 0)).to match(/^[A-Z][a-z]*( [a-z]+){11}\.$/)
  end

  it 'generates multiple sentences' do
    sentences = LoremHelper::Lorem.sentences(3)
    expect(sentences).to be_an Array
    expect(sentences.size).to eq 3
    sentences.each do |sentence|
      expect(sentence).to match(/^[A-Z][a-z]*( [a-z]+){2,8}\.$/)
    end
  end

  it 'generates a single paragraph' do
    # Default sentence is 3 - 9 words
    # Default paragraph is 3 - 6 sentences
    expect(LoremHelper::Lorem.paragraph).to match(/^([A-Z][a-z]*( [a-z]+){2,8}\. ?){3,6}$/)
  end

  it 'generates a single paragraph with custom sentence count' do
    # Specify 12 words (plus 0-6 default random)
    expect(LoremHelper::Lorem.paragraph(12)).to match(/^([A-Z][a-z]*( [a-z]+){2,8}\. ?){11,17}$/)
  end

  it 'generates a single paragraph with custom sentence count and custom random' do
    # Specify 12 words (plus 0 random)
    expect(LoremHelper::Lorem.paragraph(12, false, 0)).to match(/^([A-Z][a-z]*( [a-z]+){2,8}\. ?){12}$/)
  end

  it 'generates multiple paragraphs' do
    paragraphs = LoremHelper::Lorem.paragraphs
    expect(paragraphs).to be_an Array
    expect(paragraphs.size).to eq 3
    paragraphs = LoremHelper::Lorem.paragraphs(5)
    expect(paragraphs).to be_an Array
    expect(paragraphs.size).to eq 5
    paragraphs.each do |paragraph|
      expect(paragraph).to match(/^([A-Z][a-z]*( [a-z]+){2,8}\. ?){3,6}$/)
    end
  end

  it 'generates a single question' do
    # Default sentence is 4 - 10 words
    expect(LoremHelper::Lorem.question).to match(/^[A-Z][a-z]*( [a-z]+){3,9}\?$/)
  end

  it 'generates a single question with custom word count' do
    # Specify 12 words (plus 0-6 default random)
    expect(LoremHelper::Lorem.question(12)).to match(/^[A-Z][a-z]*( [a-z]+){11,17}\?$/)
  end

  it 'generates a single sentence with custom word count and custom random' do
    # Specify 12 words (plus 0 random)
    expect(LoremHelper::Lorem.question(12, false, 0)).to match(/^[A-Z][a-z]*( [a-z]+){11}\?$/)
  end

  it 'generates multiple questions' do
    questions = LoremHelper::Lorem.questions(3)
    expect(questions).to be_an Array
    expect(questions.size).to eq 3
    questions.each do |question|
      expect(question).to match(/^[A-Z][a-z]*( [a-z]+){2,8}\?$/)
    end
  end

  it 'generates a valid email' do
    expect(LoremHelper::Lorem.email).to match(/^\w+(\.\w+)*@\w+(\.\w+)*\.[a-z]{2,63}$/)
  end

  it 'generates a valid email with custom name' do
    expect(LoremHelper::Lorem.email('Test User')).to match(/^(test[_.]user|user[_.]test)@\w+(\.\w+)*\.[a-z]{2,63}$/)
  end

  it 'generates a valid name' do
    expect(LoremHelper::Lorem.name).to match(/^([A-Z][a-z]*\.? )?[A-Z][a-z]+ ([A-Z]([a-z]{0,2}|'))?[A-Z][a-z]+(,? \w+\.?)?$/)
  end

  it 'generates a valid first name' do
    expect(LoremHelper::Lorem.first_name).to match(/^[A-Z][a-z]+$/)
  end

  it 'generates a valid last name' do
    expect(LoremHelper::Lorem.last_name).to match(/^([A-Z]([a-z]{0,2}|'))?[A-Z][a-z]+$/)
  end

  it 'generates a valid title' do
    # Default title is 2 words
    expect(LoremHelper::Lorem.title).to match(/^[A-Z][a-z]* [A-Z][a-z]*$/)
  end

  it 'generates a valid title with custom word count' do
    # Default title is 2 words
    expect(LoremHelper::Lorem.title(12)).to match(/^[A-Z][a-z]*( [A-Z][a-z]*){11}$/)
  end

  it 'generates a valid date' do
    expect(LoremHelper::Lorem.date).to be_a Date
  end

  it 'generates a valid placeholder image' do
    # Default 300x300 PNG
    expect(LoremHelper::Lorem.image).to eq 'https://placehold.it/300x300.png'
  end

  it 'generates a valid placeholder image with custom values' do
    expect(LoremHelper::Lorem.image('100x200', 'jpeg', '010101', 'FFFFFF', 'Lorem'))
      .to eq 'https://placehold.it/100x200.jpeg/010101/FFFFFF?text=Lorem'
  end
end
