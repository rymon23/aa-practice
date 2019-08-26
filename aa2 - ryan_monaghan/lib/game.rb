require_relative "card"

class Game
  attr_reader :free_cells, :foundations, :tableau ,:move_history

  def initialize
    @free_cells = Array.new(4) { FreeCell.new }
    @foundations = Foundation.all_foundations
    @tableau = Array.new(8) { Tableau.new }
    deal_tableau
    # ...
  end

  def deal_tableau
    cards = Card.all_cards

    @tableau.each do |pile|
       until pile.cards.length == 13
        pile << cards.shift(1)
       end
    end
  end

  def move!(from_pile, to_pile)
    from_pile.draw
  end

  def move(from_pile, to_pile)
    raise "invalid move" if !valid_move?(from_pile, to_pile)
    move!(from_pile, to_pile)
    move_history 
  end

  def undo_move
    raise "no moves made" 
  end

  def valid_move?(from_pile, to_pile)
    return false if from_pile.empty?
    to_pile.valid_move?
  end

  def won?
    return false if self.foundations.empty?
    false
  end
end
