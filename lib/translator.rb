require 'yaml'
require 'pry'

def load_library(path)
  library = YAML.load_file(path)
  emoticons_hash = {}
  emoticons_hash[:get_meaning] = {}
  emoticons_hash[:get_emoticon]= {}
  library.each do |meaning, emoticon_type|
    emoticons_hash[:get_meaning][emoticon_type[1]] = meaning
    emoticons_hash[:get_emoticon][emoticon_type[0]] = emoticon_type[1]
  end
  emoticons_hash
end	

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  output = emoticon_hash[:get_emoticon][emoticon]
  output ||= "Sorry, that emoticon was not found" 
  output
end

def get_english_meaning(path,meaning)
  emoticon_hash = load_library(path)
  output = emoticon_hash[:get_meaning][meaning]
  output ||= "Sorry, that emoticon was not found" 
  output
end