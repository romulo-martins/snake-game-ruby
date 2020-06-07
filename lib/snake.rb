require 'gosu'
require_relative 'snake_game'

class Snake
    attr_accessor :x, :y

  def initialize
    @x = 10
    @y = 10

    @vel_x = 0
    @vel_y = 0
  end

  def update
    @x += @vel_x
    @y += @vel_y

    @x = 0 if @x > SnakeGame::WIDTH_IN_TILE
    @y = 0 if @y > SnakeGame::WIDTH_IN_TILE
    
    @x = SnakeGame::WIDTH_IN_TILE  if @x < 0
    @y = SnakeGame::WIDTH_IN_TILE  if @y < 0
  end

  def draw
    Gosu.draw_rect(
      @x * SnakeGame::TILE,
      @y * SnakeGame::TILE,
      SnakeGame::TILE,
      SnakeGame::TILE,
      Gosu::Color::GREEN
    )
  end

  def up;    @vel_x =  0; @vel_y = -1;  end
  def down;  @vel_x =  0; @vel_y =  1;  end
  def left;  @vel_x = -1; @vel_y =  0;  end
  def right; @vel_x =  1; @vel_y =  0;  end
end
