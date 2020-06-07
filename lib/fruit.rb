require 'gosu'
require_relative 'snake_game'

class Fruit
    attr_accessor :x, :y

  def initialize
    @x = 15
    @y = 15
  end

  def update
  end

  def draw
    Gosu.draw_rect(
      @x * SnakeGame::TILE,
      @y * SnakeGame::TILE,
      SnakeGame::TILE,
      SnakeGame::TILE,
      Gosu::Color::RED
    )
  end

  def regenerate
    @x = (rand * SnakeGame::WIDTH_IN_TILE).floor
    @y = (rand * SnakeGame::WIDTH_IN_TILE).floor
  end
end
