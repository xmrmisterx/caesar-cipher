These are our notes while doing the caesar cipher assignment from The Odin Project...

#caesar cipher

this is a popular (old?) encryption technique, used by Caesar, to hide his correspondences. We are given a string and a shift factor, and need to
output a new string in which each letter is shifted to the amount of the
shift factor. For example, if the first letter of the string is "a" and the
shift factor is 3 to the right, then the new first letter is "d". Some 
things to keep track of is wrapping the letters when we are at the begin-
ning or end of the alphabet, and also maintaining the correct upper and lower cases of the original string.

 Ok, let's try to start with some psuedocode. Let's use an example string 
 of "string" and a shift factor of 3. We want to break up the string into
 its letter components, or maybe loop through the string. Actually let's 
 be even more basic than that. So, we have a string. Now what? Look at the
 string, and go through each letter. For each letter, move that down the
 alphabet an "x factor" number of times. If at the letter "z" we need to 
 wrap around to the letter "a" with the next shift (this assumes we only
 go from left to right, which I think we'll have to, at least to start).
 If the letter is capitalized, then use a capital letter, otherwise use
 the non-capitalized form. Add each letter to a new string to form the
 modified new string.

 Ok, so what do these steps look like in code? Let's start with our string
 and split it into individual components, maybe separated by a space, then
 put that string into an array so we can loop through each letter? (I think this is the only way we know how to do it, unless a string can somehow be looped through). So, we're gonna loop through the new array. We need some way to associate each letter with a number, so that we can shift the number and get the new letter? I think we'd want a hash. In this hash the letter "a" corresponds to 0, and the letter "z" corresponds to 25. So, within our new array loop, we loop through each letter, find it's number match, then shift that number by the shift factor, being careful to wrap around if the value exceeds 25 back to 0. Once we get the new number, we match that num-ber to the corresponding letter, and make sure if the orginal was capital-ized, maybe with an "uppercase?" method, we ".uppercase" or ".downcase" the returned letter, then finally push it into a new array, which we will split and join into a new modified string.

 We forgot about the blank spaces and all the symbols and characters that
 can exist in strings, ugh.... How do we incorporate those? What if, if 
 the array item doesn't match our alphabet hash, then return it and add
 it to the new modified array? Since we don't actually shift spaces, symb-
 ols, or punctuation.

 String.split only gave us an array of 1 object, the string, googling 
 revealed that it was string.chars that gave us an array with each letter
 its own index. Adding random spaces shows that string.chars gives us
 empty spaces as well, which is exactly what we wanted, now let's try
 symbols. Yes! We are getting everything, including the spaces and symbols
 from this string.chars method.

 Ok, so we make the hash as a reference that matches the index to the letter of the alphabet. We realized that everything is in lowercase, so whatever case the original is, we have to save, before coverting it to lowercase to match our hash, if it is indeed an uppercase letter to start with.

 Ok, now how do we loop through and match the letter to the index value of
 the hash. I think we want to use the "find" method? I think this is a loop
 within a loop, like our etch-a-sketch problem. We are looping through each
 array item in string_array, and for each item, we find the key that matches the value and return it. Ok, so we did a test for loop with the string_array, set the variable as "|letter|", then printed it out with "puts" and "puts{#letter} + 1", and the results were what we wanted. Ok, so back to the problem, do we use ".find" on each letter variable and find the corresponding key? Still not sure how to code this part. Let's google the find method. We are still stuck at this looping through the array to match to number... Do we even need a hash? Aren't array indexes good enough for what we want? Review "each_with_index" method?

 Wow, we are still stuck on this iterating to find this letter. It seems
 simple, but we've tried multiple ways and can't figure it out. Let's 
 look at some solutions to see what we're doing wrong. Let's this another
 way... How would we do matching if it was just 1 array or hash? Ok we 
 gave up and looked through several solutions. First thing we noticed was
 they were all really short, and here we are really stuck lol. We also 
 noticed include was used, so we tried it, and it looks to be the method
 that we were looking for. Intuitively, "find" sounded like the method we
 wanted, but it looks like include gives us the correct functionality.Let's
 finish coding everything in our pseudocode.

 The capitalized letters are being capitalized, but the letters aren't being shifted, so fix that. We've tried more things, but for some reason still, the capitalize code doesn't shift the uppercase letters. Seems like the code should work, but if it can't for whatever reason, we can put in another array, the capitalized alphabet array, and it can enumerate through that as well? It seems whatever we are putting in that initial if statement that matches letter to letter.upcase is not doing anything, we put a puts in there and it never executed, however, the cap letter did get pushed over. Omg, now we finally understand after an hr of debugging. We are iterating through each letter in our custom string, looking for a match to our lowercase alphabet array, but the capitalized letters won't be included in that, so they just return themselves. We have to convert all the matching letters to lowercase first. Actually downcasing the cap letter will not work, we need to make it sort through 2 arrays, a lower case and an upcase version. Remember when doing the if statements in ruby there is only 1 end to each if, we put too many and tried to put it into terminal and it was confused. The syntax difference between ruby and java script threw us off and we forgot where the ends go lol. Alright, using the 2 arrrays, one for uppercase and one for lowercase, seemed to solve our problems with the casing. That was harder than it had to be it seems.

 Ok, we have one final step. Our return in currently in an array form, but
 we want the result in string form, so change the empty ciphered array into
 an empty ciphered_string and push into that instead? Lol, we can't use '
 push' with a string, so we're gonna need to concat using the '+' or '<<'
 notation. We are not comfortable with this '<<' notation, so we'll use +=
 to add to string. Since ruby has an implicit return, we don't have to re-
 the string at the end of the function. We didn't return the ciphered string and it gave us the original string lol, so we do need a 'puts' there to print out the string we want...

# alphabet_hash = {"a":0, "b":1, "c":2, "d":3, "e":4, "f":5,"g":6, "h":7,"i":8,"j":9,"k":10,"l":11,"m":12,"n":13,"o":14,"p":15,"q":16,"r":17,"s":18,"t":19,"u":20,"v":21,"w":22,"x":23,"y":24,"z":25} # We thought we needed a hash initially, but an array is fine bc arrays have an index value and the array value, which is all we need for this.


# if letter == letter.upcase # by default, all of our letters are downcase, so we don't have to check for the downcase scenario as it is the default one, we just want to upcase it if the original letter is upcase

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