require 'bundler/setup'
require 'dino'

board = Dino::Board.new(Dino::TxRx::Serial.new)
button = Dino::Components::Button.new(pin: 6, board: board)
led = Dino::Components::Led.new(pin: 13, board: board)

button.down do
  puts "button NOT pressed"
  [:on, :off].cycle do |switch|
    led.send(switch)
    sleep 0.02
  end
  end

button.up do
  puts "button pressed!"
  [:off, :off].cycle do |switch|
    led.send(switch)
    sleep 
  end
end

sleep