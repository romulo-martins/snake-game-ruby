require 'gosu'
require_relative 'snake_game'

class Snake
    attr_accessor :x, :y

  def initialize
    @x = 10
    @y = 10

    @vel_x = 0
    @vel_y = 0

    @tail = 3
    @position = []
  end

  def update
    @x += @vel_x
    @y += @vel_y

    @x = 0 if @x > SnakeGame::WIDTH_IN_TILE
    @y = 0 if @y > SnakeGame::WIDTH_IN_TILE
    
    @x = SnakeGame::WIDTH_IN_TILE  if @x < 0
    @y = SnakeGame::WIDTH_IN_TILE  if @y < 0

    @position << [@x, @y]
    @position.shift until @position.size <= @tail
  end

  def draw
    @position.each do |x, y|
      Gosu.draw_rect(
        x * SnakeGame::TILE,
        y * SnakeGame::TILE,
        SnakeGame::TILE - 1,
        SnakeGame::TILE - 1,
        Gosu::Color::GREEN
      )
    end
  end

  def increase
    @tail += 1
  end

  def up;    @vel_x =  0; @vel_y = -1;  end
  def down;  @vel_x =  0; @vel_y =  1;  end
  def left;  @vel_x = -1; @vel_y =  0;  end
  def right; @vel_x =  1; @vel_y =  0;  end
end
