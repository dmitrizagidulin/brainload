class Category
  include Ripple::Document

  property :name, String, presence: true  # e.g. 'Computer Science'
  property :url_slug, String, presence: true  # e.g. 'comp_sci' - used for human readable unique keys
  timestamps!

  key_on :url_slug

  many :card_decks, :class_name => "CardDeck"
  
  def card_decks
    CardDeck.find_by_index(:category_key, self.key)
  end
end