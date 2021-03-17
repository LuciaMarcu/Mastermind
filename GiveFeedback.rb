module GiveFeedback

  def explain_feedback
    puts print_message('explain_feedback')
  end

  def give_feedback(secret, guess, correct)
    exact_match = Array.new
    correct.clear
    cloned_secret = secret.clone
    cloned_guess = guess.clone
    exact_position(cloned_secret, cloned_guess, correct, exact_match)
    remove_exact_match(cloned_secret, cloned_guess, exact_match)  
    include_elem(cloned_secret, cloned_guess, correct)    
    if correct.empty? == true
      no_guess
    end
    return correct
  end 

  def include_elem(secret, guess, correct)
    secret.each{|elem|    
      if guess.include?(elem) 
        guess.delete_at(guess.index(elem) || guess.length)
        correct.push("0")       
      end  
    }
    return correct
  end

  def remove_exact_match(secret, guess, match)
    match.each{|elem|
      secret.delete_at(secret.index(elem) || secret.length)
      guess.delete_at(guess.index(elem) || guess.length)
    }
    return secret
  
  end

  def exact_position(secret, guess, correct, exact_match)   
    secret.each_with_index{|elem_a, index_a|
      guess.each_with_index {|elem_b, index_b|         
        if elem_a == elem_b && index_a == index_b
          correct.push("X")    
          exact_match.push(elem_a)          
        end
      }   
    }
    return exact_match
  
  end

  def make_feedback_str(correct)
    str = correct.join(' ')
    puts "The feedback is: #{str}."
    if str == "X X X X"
      puts print_message('winn')
    end       
    return str   
  end

  def no_guess
     puts print_message('no_guess')   
  end


end