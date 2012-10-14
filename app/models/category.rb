class Category
  include Ripple::Document

  property :name, String, presence: true   # e.g. 'Computer Science'
  property :url_slug, String, presence: true, index: true  # e.g. 'comp_sci' - used for human readable unique keys
  timestamps!

  key_on :url_slug

  def card_decks
    CardDeck.find_by_index(:category_key, self.key)
  end
  
  def self.all
    Category.find_by_index('$bucket','_')
  end
  
  def self.select_options
    categories = Category.all
    categories = categories.reject {|c| c.name == 'Uncategorized'}
    
    categories = categories.collect {|c| [c.name, c.key] }
    categories = [['Uncategorized', 'uncategorized']] + categories.sort!
  end
  
  def self.uncategorized_key
    'uncategorized'
  end
end
