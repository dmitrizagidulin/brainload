class Review
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :card_key, :answer

  def initialize(attributes = {})
    self.card_key = attributes[:card_key]
    self.answer = attributes[:answer]
  end

  def correct?
    answer == card.answer
  end

  def next
    return self.card_key unless correct?
    all_cards = Card.find_by_index :card_deck_key, card.card_deck_key
    all_cards.reject{|c| c.key == self.card_key}.first.key
  end

  def card
    @card ||= Card.find card_key
  end

  def persisted?
    true
  end

  def id
    card_key
  end
end