#!/usr/bin/env ruby

def main
  puts "Reading characters from text file\n"
  sleep 0.5
  clear_terminal

  characters = []
  File.open("vocab.txt").each do |character|
    characters << character.strip
  end

  attempt_map = create_character_attempt_map(characters)
  total_characters = characters.size
  incorrect_answers = []

  until characters.none? do
    characters.shuffle.each do |character|
      puts "Type in character using Pinyin.\n"
      puts "Character: #{character}"

      if gets.chomp == character
        characters -= [character]
      else
        incorrect_answers << character unless incorrect_answers.include?(character)
        attempt_map[character] += 1
      end

      clear_terminal
    end
  end

  puts "Your results on first attempt:\n"
  puts "Correct: #{total_characters - incorrect_answers.size}/#{total_characters}\n"
  puts "Incorrect: #{incorrect_answers.size}/#{total_characters}\n"
  puts "Most common mistake: #{most_common_mistake(attempt_map)}"
end

def most_common_mistake(attempt_map)
  filtered_map = attempt_map.reject { |character, attempts| attempts.zero? }
  return "No mistakes!" if filtered_map.empty?

  filtered_map.max_by(&:last).first
end

def create_character_attempt_map(characters)
  characters.each_with_object({}) do |character, hash|
    hash[character] = 0
  end
end

def clear_terminal
  puts "\e[H\e[2J"
end

main