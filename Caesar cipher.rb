def caesar_cipher(string, shift_factor) # Cipher function with inputs for a custom string and shift factor.
  string_array = string.chars   # This breaks up our custom string into individual characters stored in a 'string_array' variable.

  alphabet_array = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"] # when we put the alphabet array outside of the function, calling the function results in an "undefined local variable or method" error, so the array we want to compare to needs to go inside the function, which begs the question, is there a way to set this as a "global" array outside of the function, where the function can see it?

  capitalized_array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"] # we need an upper and lower case alphabet array, in order to match characters in our string vs the alphabet, and both upper and lower case helps retain the capitalization of the string.

  ciphered_string = ""  # This is where we add the letters of our new encrypted string, and is what we want outputted in the end.

  string_array.each do |letter| # Loop through each character in the string_array, and let each character be a variable called 'letter'

   if alphabet_array.include?(letter) # If the lower case alphabet array includes a character ('letter')...
    shifted_index = (alphabet_array.find_index(letter)) + shift_factor # Get the index value of the letter in the lower case alphabet array that matches our string character, add the shift factor to it, and set it as a new variable called "shifted_index"
      while shifted_index > 25 do # For large shift factors, this while loop subtracts 26 from the shifted_index, until it is 25 or smaller, in effect wrapping the letters around once it gets to the end of the alphabet.
        shifted_index = shifted_index - 26
      end
    new_letter = alphabet_array[shifted_index] # Set the letter in the alphabet array at the shifted index spot equal to a new variable called 'new_letter'
    ciphered_string += new_letter # Add this new letter into our ciphered string and set it to equal to the modified string.
   
    elsif capitalized_array.include?(letter)  # This is the same loop as above, but now we are looping through the capitalized Alphabet array.
      shifted_index = (capitalized_array.find_index(letter)) + shift_factor
        while shifted_index > 25 do
          shifted_index = shifted_index - 26
        end
      new_letter = capitalized_array[shifted_index]
      ciphered_string += new_letter  
    else  # If the character in our given string doesn't match the either the lower case alphabet array or upper case alphabet array, then add it to our ciphered string as it is. This includes any spaces and punctuation.
      ciphered_string += letter

    end

  end

  p ciphered_string # We need to print out the result

end





  