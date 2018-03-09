# frozen_string_literal: true

RSpec.describe LoremHelper::Static do
  it 'generates a single word' do
    expect(LoremHelper::Static.word).to eq 'lorem'
  end

  it 'generates multiple words' do
    expect(LoremHelper::Static.words(5)).to eq %w[alias consequatur aut perferendis sit]
  end

  it 'generates a single character' do
    expect(LoremHelper::Static.character).to eq '0'
  end

  it 'generates multiple characters' do
    expect(LoremHelper::Static.characters).to eq '0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz012'
  end

  it 'generates multiple characters with custom count' do
    expect(LoremHelper::Static.characters(12)).to eq '0123456789ab'
  end

  it 'generates a single sentence' do
    # Default sentence is 4 - 10 words
    expect(LoremHelper::Static.sentence).to eq 'Alias consequatur aut perferendis sit voluptatem accusantium.'
  end

  it 'generates a single sentence with custom word count' do
    # Specify 12 words (plus 0-6 default random)
    expect(LoremHelper::Static.sentence(12)).to eq 'Alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam eaque ipsa quae ab illo inventore.'
  end

  it 'generates a single sentence with custom word count and custom random' do
    # Specify 12 words (plus 0 random)
    expect(LoremHelper::Static.sentence(12, false, 0)).to eq 'Alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam eaque ipsa quae.'
  end

  it 'generates multiple sentences' do
    sentences = LoremHelper::Static.sentences(3)
    expect(sentences).to be_an Array
    expect(sentences[0]).to eq 'Alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam.'
    expect(sentences[1]).to eq 'Accusantium doloremque aperiam eaque ipsa quae ab illo inventore.'
    expect(sentences[2]).to eq 'Ab illo inventore veritatis et quasi architecto beatae vitae.'
  end

  it 'generates a single paragraph' do
    expect(LoremHelper::Static.paragraph).to eq 'Alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam. Accusantium doloremque aperiam eaque ipsa quae ab illo inventore. Ab illo inventore veritatis et quasi architecto beatae vitae. Architecto beatae vitae dicta sunt explicabo aspernatur aut odit. Aspernatur aut odit aut fugit sed quia consequuntur magni.'
  end

  it 'generates a single paragraph with custom sentence count' do
    # Specify 12 words (plus 0-6 default random)
    expect(LoremHelper::Static.paragraph(12)).to eq 'Alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam. Accusantium doloremque aperiam eaque ipsa quae ab illo inventore. Ab illo inventore veritatis et quasi architecto beatae vitae. Architecto beatae vitae dicta sunt explicabo aspernatur aut odit. Aspernatur aut odit aut fugit sed quia consequuntur magni. Quia consequuntur magni dolores eos qui ratione voluptatem sequi. Ratione voluptatem sequi nesciunt neque dolorem ipsum quia dolor. Ipsum quia dolor sit amet consectetur adipisci velit sed. Adipisci velit sed quia non numquam eius modi tempora. Eius modi tempora incidunt ut labore et dolore magnam. Et dolore magnam aliquam quaerat voluptatem ut enim ad. Ut enim ad minima veniam quis nostrum exercitationem ullam. Nostrum exercitationem ullam corporis nemo enim ipsam voluptatem quia. Ipsam voluptatem quia voluptas sit suscipit laboriosam nisi ut.'
  end

  it 'generates a single paragraph with custom sentence count and custom random' do
    # Specify 12 words (plus 0 random)
    expect(LoremHelper::Static.paragraph(12, false, 0)).to eq 'Alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam. Accusantium doloremque aperiam eaque ipsa quae ab illo inventore. Ab illo inventore veritatis et quasi architecto beatae vitae. Architecto beatae vitae dicta sunt explicabo aspernatur aut odit. Aspernatur aut odit aut fugit sed quia consequuntur magni. Quia consequuntur magni dolores eos qui ratione voluptatem sequi. Ratione voluptatem sequi nesciunt neque dolorem ipsum quia dolor. Ipsum quia dolor sit amet consectetur adipisci velit sed. Adipisci velit sed quia non numquam eius modi tempora. Eius modi tempora incidunt ut labore et dolore magnam. Et dolore magnam aliquam quaerat voluptatem ut enim ad. Ut enim ad minima veniam quis nostrum exercitationem ullam.'
  end

  it 'generates multiple paragraphs' do
    paragraphs = LoremHelper::Static.paragraphs
    expect(paragraphs).to be_an Array
    expect(paragraphs.size).to eq 3
    paragraphs = LoremHelper::Static.paragraphs(2)
    expect(paragraphs).to be_an Array
    expect(paragraphs.size).to eq 2
    expect(paragraphs[0]).to eq 'Alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam. Accusantium doloremque aperiam eaque ipsa quae ab illo inventore. Ab illo inventore veritatis et quasi architecto beatae vitae. Architecto beatae vitae dicta sunt explicabo aspernatur aut odit. Aspernatur aut odit aut fugit sed quia consequuntur magni.'
    expect(paragraphs[1]).to eq 'Quia consequuntur magni dolores eos qui ratione voluptatem sequi. Ratione voluptatem sequi nesciunt neque dolorem ipsum quia dolor. Ipsum quia dolor sit amet consectetur adipisci velit sed. Adipisci velit sed quia non numquam eius modi tempora. Eius modi tempora incidunt ut labore et dolore magnam.'
  end

  it 'generates a single question' do
    # Default sentence is 4 - 10 words
    expect(LoremHelper::Static.question).to eq 'Alias consequatur aut perferendis sit voluptatem accusantium?'
  end

  it 'generates a single question with custom word count' do
    # Specify 12 words (plus 0-6 default random)
    expect(LoremHelper::Static.question(12)).to match eq 'Alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam eaque ipsa quae ab illo inventore?'
  end

  it 'generates a single sentence with custom word count and custom random' do
    # Specify 12 words (plus 0 random)
    expect(LoremHelper::Static.question(12, false, 0)).to eq 'Alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam eaque ipsa quae?'
  end

  it 'generates multiple questions' do
    questions = LoremHelper::Static.questions
    expect(questions).to be_an Array
    expect(questions.size).to eq 3
    questions = LoremHelper::Static.questions(2)
    expect(questions).to be_an Array
    expect(questions.size).to eq 2
    expect(questions[0]).to eq 'Alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam?'
    expect(questions[1]).to eq 'Accusantium doloremque aperiam eaque ipsa quae ab illo inventore?'
  end

  it 'generates a valid email' do
    expect(LoremHelper::Static.email).to eq 'example@example.com'
  end

  it 'generates a valid email with custom name' do
    expect(LoremHelper::Static.email('Test User')).to eq 'test.user@example.com'
  end

  it 'generates a valid name' do
    expect(LoremHelper::Static.name).to eq 'John Smith'
  end

  it 'generates a valid first name' do
    expect(LoremHelper::Static.first_name).to eq 'John'
  end

  it 'generates a valid last name' do
    expect(LoremHelper::Static.last_name).to eq 'Smith'
  end

  it 'generates a valid title' do
    # Default title is 2 words
    expect(LoremHelper::Static.title).to eq 'Alias Consequatur'
  end

  it 'generates a valid title with custom word count' do
    # Default title is 2 words
    expect(LoremHelper::Static.title(12)).to eq 'Alias Consequatur Aut Perferendis Sit Voluptatem Accusantium Doloremque Aperiam Eaque Ipsa Quae'
  end

  it 'generates a valid date' do
    expect(LoremHelper::Static.date).to eq Date.new(2001, 2, 3)
  end

  it 'generates a valid placeholder image' do
    # Default 300x300 PNG
    expect(LoremHelper::Static.image).to eq 'https://placehold.it/300x300.png'
  end

  it 'generates a valid placeholder image with custom values' do
    expect(LoremHelper::Static.image('100x200', 'jpeg', '010101', 'FFFFFF', 'Lorem'))
      .to eq 'https://placehold.it/100x200.jpeg/010101/FFFFFF?text=Lorem'
  end
end
