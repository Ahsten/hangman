module Display
    def instructions
        <<~HEREDOC
        Welcome to Hangman. The goal of the game is to solve the secret word by guessing letters within
        a certain number of guesses. You are only allowed 7 incorrect guesses. Guess a letter to start

        HEREDOC
    end

    def display_winning_message
        <<~HEREDOC

        #{@correct_guesses.join}

        Congratus you won!
        HEREDOC
    end

    def display_losing_message
        <<~HEREDOC

        Sorry you lost!
        HEREDOC
    end

    def display_all_incorrect_guessed
        <<~HEREDOC

        Incorrect guesses: #{@incorrect_guesses}
        HEREDOC
    end

    def display_spaces(word)
        <<~HEREDOC

        #{word}
        HEREDOC
    end

    def display_incorrect_guess
        <<~HEREDOC

        Sorry that letter is not in the word
        HEREDOC
    end

    def display_turn_prompt
        <<~HEREDOC
            Type 'save' or 'exit' to leave the game
            Guess a letter
        HEREDOC
    end

    def display_play_again
        <<~HEREDOC

          Would you like to play again?
          \e[34m[1]\e[0m yes
          \e[34m[2]\e[0m no
            
        HEREDOC
      end
end