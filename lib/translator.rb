# require modules here
require 'yaml'

def load_library(yml)
  # code goes here
  new_emoticons = {}

  library = YAML.load_file(yml)

  library.each do |key, value|
    new_emoticons[key] = {}
    new_emoticons[key][:english] = value[0]
    new_emoticons[key][:japanese] = value[1]
  end
  new_emoticons
end



def get_japanese_emoticon(yml, western_emoticon)
  # code goes here
  library = load_library(yml)

  library.each do |key,value|
    if library[key][:english] == western_emoticon
       return library[key][:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(yml, japanese_emoticon)
  # code goes here
  library = load_library(yml)
  library.each do |key, value|
    if library[key][:japanese] == japanese_emoticon
      return key
    end
  end
  "Sorry, that emoticon was not found"
end

