#Display Intructions
#choose a word randomly
#display dashes according to word length
#take in letter guess
#check if it is in the word
#display results of guess
#guess until word is guessed or all 7 lives are lost

require './display'

class Game
    include Display
    def initialize()
        @correct_guesses = []
        @incorrect_guesses = []
        play_game
    end

    def get_word
        words_list = File.readlines('words.txt')
        words_list.each.select { |word| word.length.between?(5, 12)}
        words_list[rand(0..words_list.length)].chomp.split("")
    end

    def play_game
        puts instructions
        @word = get_word
        print @word
        add_dashes(@word.length)
        
        until check_win == true
            puts display_turn_prompt
            @guess = gets.chomp.downcase
            check_guess()
            puts display_spaces(@correct_guesses.join)
            puts display_all_incorrect_guessed
        end

        end_game
    end
    
    def check_guess
        if @word.include?(@guess) == false 
            @incorrect_guesses.push(@guess)
            puts display_incorrect_guess
        else
            @word.each_with_index do |letter, index|
                if @guess == letter
                    @correct_guesses[index] = @guess
                end
            end
        end
    end

    def check_win
        if @correct_guesses.include?("_") == false
            puts display_winning_message
            return true            
        elsif @incorrect_guesses.length > 6
            puts display_losing_message
            return true
        end
    end

    def add_dashes(word_length)
        word_length.times do
            @correct_guesses.push("_")
        end
    end

    def end_game
        puts display_play_again
        play_again = gets.chomp
        Game.new if play_again == '1'
    end
end