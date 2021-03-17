require './Computer'
require './Text'
require './Human'
require './GiveFeedback.rb'

class Game
  include Human
  include Computer
  include Text
  include GiveFeedback

  attr_accessor :secret_code, :guesses, :correct_guess, :colors, :feedback

  def initialize      
      @secret_code = Array.new
      @guesses = Array.new
      @correct_guess = Array.new
      @colors = ["red", "blue", "green", "yellow", "purple", "orange"]
      @feedback = ""
  end

  def play
      explain_feedback
      role = pick_role      
      if role == 'm'
        @secret_code = human_generate_code(@secret_code) 
        i = 1
        @colors.each do |color|
          fill_guess(@guesses, color)           
          match_hash = make_hash(@guesses, @secret_code)      
          match = transform_hash(match_hash)  
          @guesses.clear
          @guesses.concat(match)       
          give_feedback(@secret_code, @guesses, @correct_guess)
          @feedback = make_feedback_str(@correct_guess)           
          sleep(1)           
          break if @guesses.length == 4       
          break if @feedback == "X X X X" 
          i += 1          
        end  
        final_guess = permute_guess(@guesses, @feedback)  
        final_guess.each{|comb|
            break if i == 12
            i += 1
            puts "Computer guessed: #{comb}."
            give_feedback(@secret_code, comb, @correct_guess)
            @feedback = make_feedback_str(@correct_guess)
            break if @feedback == "X X X X" 
            sleep(1)
          }  
        if @feedback != "X X X X"
          puts print_message('exeed_attemp') 
        end
        
      elsif role == 'b'
        @secret_code = comp_generate_code(@secret_code) 
        j = 12
        12.times do
          @guesses = human_brake_code(@guesses)
          give_feedback(@secret_code, @guesses, @correct_guess)
          @feedback = make_feedback_str(@correct_guess)        
          break if @feedback == "X X X X"
          j -=1
          puts "You have #{j} attempts left."
        end
        if @feedback != "X X X X"
          puts print_message('exeed_attemp') 
        end
      end     
     
      
  end

  def permute_guess(guess, feedback)
    final_comb = guess.permutation(4).to_a    
    final_comb.delete_if{|comb|
      give_feedback(@secret_code, comb, @correct_guess).count('X') < feedback.count('X') 
      }    
    return final_comb
  end
  
  def pick_role
    puts print_message('pick_role')
    role = gets.chomp
    return role
  end 
  
  



end