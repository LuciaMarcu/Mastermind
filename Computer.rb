module Computer 


  def fill_guess(guess, color)
    j = 4 - guess.length
    if j <= 4
      j.times do
        guess.push(color)     
      end
    end
    puts "Computer guessed: #{guess}." 
    return guess  
  end

  def make_hash(guess, secret)
    color_hash = Hash.new
    guess.each{|elem|
      if color_hash.has_key?(elem) == false
        value = secret.count(elem)
        color_hash[elem] = value         
      end
    }    
    return color_hash
  end

  def transform_hash(color_hash)
    good_colors = Array.new
    color_hash.each{|k, v|
      v.times do
        good_colors.push(k)
      end  
    }
    return good_colors
  end       
      

  def comp_generate_code(secret)
    puts "The computer has created a code of 4 colors from red, blue, green, yellow, purple, orange.\n 
    He has the option to use more than one of the same color.\n 
    For example, he could put down Green Yellow Yellow Blue.\n
    You have 12 possible attempts for finding the secret code.\n"
    colors = ["red", "blue", "green", "yellow", "purple", "orange"]  
    4.times do
      color = colors[rand(colors.size)]
      secret.push(color)
    end        
    return secret

  end

end