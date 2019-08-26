# -*- coding: utf-8 -*-

class Card
  SUIT_STRINGS = {
    clubs: '♣',
    diamonds: '♦',
    hearts: '♥',
    spades: '♠'
  }

  VALUE_STRINGS = {
    ace: 'A',
    deuce: '2',
    three: '3',
    four: '4',
    five: '5',
    six: '6',
    seven: '7',
    eight: '8',
    nine: '9',
    ten: '10',
    jack: 'J',
    queen: 'Q',
    king: 'K'
  }

  # Returns an array of all suits.
  def self.suits
    SUIT_STRINGS.keys
  end

  # Returns an array of all values.
  def self.values
    VALUE_STRINGS.keys
  end

  def self.by_suit(suit)
    values.map { |val| Card.new(suit, val) }
  end

  def self.all_cards
    result = []
    suits.each do |s|
      values.each do |v|
        result << Card.new(s,v)
      end
    end
    result 
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    raise "bad initialization" unless SUIT_STRINGS.include?(suit) && VALUE_STRINGS.include?(value)
    @suit = suit
    @value = value
  end

  def color
    if suit == :clubs || suit == :spades
      :black
    else
      :red
    end
  end

  # Returns an integer value of card's rank (aces low). For example:
  # 2 of Clubs rank: 2. Jack of Hearts: 11. Ace of Spades: 1
  def rank
    VALUE_STRINGS.keys.index(self.value) + 1
  end

  # Compares two cards to see if they're equal in suit & value.
  # DO NOT CHANGE THIS METHOD
  def ==(other)
    other.is_a?(Card) && value == other.value && suit == other.suit
  end

  def to_s
    "#{VALUE_STRINGS[value]} #{SUIT_STRINGS[suit]}"
  end
end
