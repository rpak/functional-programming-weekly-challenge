#! /usr/bin/ruby

require './printer'

def match(char_input, match, count)
  matches = exclusive_matches char_input.chars, match
  matches.length == count
end

def exclusive_matches(char_input, match, match_ranges = [])
  char_input.each_with_index {|char, index|
    range = index...(index + match.length)
    chunk = char_input[range].join
    match_ranges << range if exclusive_match? chunk, match, match_ranges, range
  }
  match_ranges
end

def exclusive_match?(chunk, match, match_ranges, range)
  chunk == match && match_ranges.none?{|match_range| match_range.include?(range.first)}
end

print_result match('abcabc', 'abc', 1) == false
print_result match('bcab', 'cab', 1) == true
print_result match('abcabc', 'abc', 2) == true
print_result match('Hello Jello', 'ello', 2) == true
print_result match('Hello Jello', 'ello', 3) == false
print_result match('Ratatattat', 'at', 3) == false
print_result match('Ratatattat', 'at', 4) == true
print_result match('oooo', 'ooo', 2) == false
print_result match('ooooo', 'ooo', 2) == false

print "\n"
