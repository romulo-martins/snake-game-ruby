# frozen_string_literal: true

require 'gosu'

class SnakeGame < Gosu::Window
  WIDTH = 400
  HEIGHT = 400
  TILE = 10

  WIDTH_IN_TILE = WIDTH / TILE

  def initialize
    super WIDTH, HEIGHT, false, 1000 / 15

    @snake = Snake.new
  end

  def update
    @snake.update
  end

  def draw
    @snake.draw
  end

  def button_down(id)
    case id
    when Gosu::KbUp    then @snake.up
    when Gosu::KbDown  then @snake.down
    when Gosu::KbLeft  then @snake.left
    when Gosu::KbRight then @snake.right
    end
  end
end

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

SnakeGame.new.show
