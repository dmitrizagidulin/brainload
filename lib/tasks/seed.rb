def seed_categories
  seed_data = YAML.load(IO.read(File.dirname(__FILE__) + '/../../db/categories.yml'))
  puts "Seeding Categories"
  seed_data.each do |category|

    @category = Category.new( :name => category[:name],
                              :url_slug => category[:url_slug])
    puts " .."+@category.name
    @category.save!
  end
end

def seed_cards
  puts "Seeding Card Decks"
  seed_data = YAML.load(IO.read(File.dirname(__FILE__) + '/../../db/card_decks.yml'))
  seed_data.each do |card_deck|

    @card_deck = CardDeck.new(:user_key => @user.key,
                              :name => card_deck[:name],
                              :description => card_deck[:description],
                              :category_key => card_deck[:category_key],
                              :deck_type => card_deck[:deck_type])  # private or public
    @card_deck.save!
    
    card_count = 0
    card_deck[:cards].each do |card|
      Card.new(:card_deck_key => @card_deck.key,
               :question => card[:question],
               :answer => card[:answer]).save!
      card_count += 1
    end
    puts " .."+@card_deck.name + " ("+card_count.to_s+" cards)"
  end
end

def seed_users
  puts "Seeding Users"
  @user = User.new(:email => "bob@example.com", :password => "2asxlkwme")
  puts " .."+@user.email
  @user.save!
end

def seed_all
  seed_users
  seed_categories
  seed_cards
end

def clear_all
  Category.all.each(&:destroy)
  User.all.each(&:destroy)
  Card.all.each(&:destroy)
  CardDeck.all.each(&:destroy)
end

task :seed do
  seed_all
end

task :reseed do
  clear_all
  seed_all
end

task :clear_decks do
  CardDeck.all.each(&:destroy)
end

task :clear_users do
  User.all.each(&:destroy)
end

task :clear_cards do
  Card.all.each(&:destroy)
end

task :clear_all do
  clear_all
end