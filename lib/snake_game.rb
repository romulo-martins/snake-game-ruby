require 'gosu'
require_relative 'snake'
require_relative 'fruit'

class SnakeGame < Gosu::Window
  WIDTH  = 400
  HEIGHT = 400
  TILE   = 10

  WIDTH_IN_TILE = WIDTH / TILE

  def initialize
    super WIDTH, HEIGHT, false, 1000 / 15

    @snake = Snake.new
    @fruit = Fruit.new
  end

  def update
    if eat_fruit?
        @fruit.regenerate
        @snake.increase
    end
    if @snake.self_colide?
      reset_game
    end
    @snake.update
  end

  def draw
    @snake.draw
    @fruit.draw
  end

  def button_down(id)
    case id
    when Gosu::KbUp     then @snake.up
    when Gosu::KbDown   then @snake.down
    when Gosu::KbLeft   then @snake.left
    when Gosu::KbRight  then @snake.right
    when Gosu::KbEscape then exit
    end
  end

  private 

  def eat_fruit?
    @snake.x == @fruit.x && @snake.y == @fruit.y
  end

  def reset_game
    @snake = Snake.new
    @fruit = Fruit.new
  end
end
