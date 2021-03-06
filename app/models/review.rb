class Review
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :card_key, :answer, :user

  def initialize(attributes = {})
    self.user = attributes[:user]
    self.card_key = attributes[:card_key]
    self.answer = attributes[:answer]
  end

  def correct?
    answer.downcase == card.answer.downcase
  end

  def next
    all_cards = Card.find_by_index :card_deck_key, card.card_deck_key
    candidate = all_cards.reject{|c| c.key == self.card_key}.first
    return nil if candidate.nil?
    return candidate.key
  end

  def card
    return nil if self.card_key.nil?
    @card ||= user.allowed_card card_key
  end

  def persisted?
    true
  end

  def id
    card_key
  end
end