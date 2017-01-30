require 'pry'

def begins_with_r(array)
  array.all? do |word|
    word.start_with? "r"
  end
end

def contain_a(array)
  array.select do |word|
    word.include? "a"
  end
end

#def contain_a(array)
#  aarray = []
#  array.each do |word|
#    if word.include?("a")
#      aarray << word
#    end
#  end
#  return aarray
#end

def first_wa(array)
  word_array = []
  array.each do |element|
    if element.class == String
      word_array << element
    end
  end

## I had to build a new array without :symbols
## because .start_with? only works on strings.
## Using a word[0] && [1] boolean instead of .start_with?
## would also work with :symbols,
## and removes the need for a special word_array.
## A word[0, 1] boolean does not seem to work

  word_array.find do |word|
    word.start_with? "wa"
  end
end

def remove_non_strings(array)
  ## I had to make and populate a new array here because
  ## element.class == String seemed to return true for :symbol
  word_array = []
  array.each do |element|
    if element.class == String
      string = array.delete(element)
      word_array << string
    end
  end
  return word_array
end

def count_elements(array)
  counted_elements = []

  array.each do |hash|
    hash.each do |n, name|
      item_hash = {}
      count = array.count(hash)
      item_hash[:name] = hash[:name]
      item_hash[:count] = count
      counted_elements << item_hash
      counted_elements.uniq!
    end
  end
  return counted_elements
end

#### Still broken
def merge_data(keys, data)
  merged_data = []

  keys.each do |first_name|
    person_hash = first_name

    person_hash.each do |n, name|
      full_hash = {}
      ##iterating into data hash in spec
      data.each do |info_hash|
        info_hash.each do |name1, stats|
          if name1 == person_hash[:first_name]
            full_hash = person_hash.merge(stats)
          end
        end
      end
      merged_data << full_hash
    end
  end
  return merged_data
end

def find_cool(array)
  array.each do |hash|
    if hash[:temperature] != "cool"
      array.delete(hash)
    end
  end
end

def organize_schools(schools)
  organized_schools = {}

  schools.each do |school, info|
    info.each do |location, place|
      if organized_schools[place] == nil
        school_array = []
        school_array << school
        organized_schools[place] = school_array
      else
        school_array = organized_schools[place]
        school_array << school
        organized_schools[place] = school_array
      end
    end
  end
  return organized_schools
end
