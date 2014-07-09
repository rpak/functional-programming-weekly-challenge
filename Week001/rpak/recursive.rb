#! /usr/bin/ruby

require './printer'

def match(source, match, count)
  match_count(source.chars, match) == count
end

def match_count(source, match)
  found_match = source.join.start_with? match
  match_count = found_match ? 1 : 0
  substring = source.drop found_match ? match.length : 1
  return match_count if substring.empty?
  match_count(substring, match) + match_count
end

print_result match('abcabc', 'abc', 1) == false
print_result match('abcabc', 'abc', 2) == true
print_result match('Hello Jello', 'ello', 2) == true
print_result match('Hello Jello', 'ello', 3) == false
print_result match('Ratatattat', 'at', 3) == false
print_result match('Ratatattat', 'at', 4) == true
print_result match('oooo', 'ooo', 2) == false

print "\n"
