require 'yaml'

module Database
    def save_game(game_name)
        Dir.mkdir 'output' unless Dir.exist? 'output'
        
        filename = "output/#{game_name}.yaml"

        File.open(filename, 'w') do |file|
            file.write save_yaml
        end
    end

    def save_yaml
        YAML.dump(
            'word' => @word,
            'correct_guesses' => @correct_guesses,
            'incorrect_guesses' => @incorrect_guesses,
        )
    end

    def load_game(filename)
        file = YAML.load(File.read("output/#{filename}"))
        @word = file['word']
        @correct_guesses = file['correct_guesses']
        @incorrect_guesses = file['incorrect_guesses']
    end

    def get_files
        files = []

        Dir.entries('output').each do |file|
            files.push(file)
        end

        files
    end
end