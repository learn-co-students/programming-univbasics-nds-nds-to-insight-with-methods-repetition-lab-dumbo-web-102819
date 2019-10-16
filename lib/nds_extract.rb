$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  # Write this implementation
  list_d = Array.new
  dir_index = 0
  while dir_index < source.size do
    list_d << source[dir_index][:name]
    dir_index += 1
  end
  list_d
end

def total_gross(source)
  running_total = 0
  names_of_directors_array = list_of_directors(source)
  index_of_directors = 0
  directors_totals_hash = directors_totals(source)
  while index_of_directors < names_of_directors_array.size do
    director_name_key = names_of_directors_array[index_of_directors]
    running_total += directors_totals_hash[director_name_key]
    index_of_directors += 1
  end
  running_total
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end
