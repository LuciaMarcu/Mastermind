module Human

    def human_generate_code(secret)
        puts "Type down a code of 4 colors for the computer to brake."
        color = gets.chomp
        secret = color.split            
        return secret

    end

    def human_brake_code(guess) 
        guess.clear     
        puts "Type your guess, 4 colors from: red, blue, green, yellow, purple, orange."    
        color = gets.chomp
        guess = color.split    
        puts "Your guesses are: #{guess}."
        return guess

    end

end