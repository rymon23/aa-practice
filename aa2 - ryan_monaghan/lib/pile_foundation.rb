require_relative "pile"

class Foundation < Pile
  def self.all_foundations
    Card.suits.map { |suit| Foundation.new(suit) }
  end

  attr_reader :suit

  def initialize(suit, cards = [])
    @suit = suit
    @cards = cards
  end

  def complete?
    return false if @cards.empty?
    Card.suits.all do |s|
      @cards.any? {|card| Card.suits.include?(card.suit)}
    end

    #@cards.all {|card| card.suit == self.suit }
    false
  end

  def to_s
    empty? ? "[ #{Card::SUIT_STRINGS[suit]}]" : "[#{top_card}]"
  end

  def valid_move?(card)
    card.suit == suit || card.value != self.top_card.value

  end
end
