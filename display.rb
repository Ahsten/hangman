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
end