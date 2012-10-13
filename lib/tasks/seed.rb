task :seed do
  @user = User.new(:email => "bob@example.com", :password => "2asxlkwme")
  @user.save!


  seed_data = YAML.load(IO.read(File.dirname(__FILE__) + '/../../db/card_decks.yml'))
  seed_data.each do |card_deck|

    @card_deck = CardDeck.new(:user_key => @user.key,
                              :name => card_deck[:name],
                              :description => card_deck[:description])
    @card_deck.save!
    card_deck[:cards].each do |card|
      Card.new(:card_deck_key => @card_deck.key,
               :question => card[:question],
               :answer => card[:answer]).save!
    end
  end
end