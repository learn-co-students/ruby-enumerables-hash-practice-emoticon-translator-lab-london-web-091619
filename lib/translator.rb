require 'yaml'
require 'pry'

def load_library(file_path)
 library = YAML.load_file(file_path)
 emoticon_hash = { "get_meaning" => {}, "get_emoticon" => {} }
 library.each do |meaning, emoticons|
   emoticon_hash["get_meaning"][emoticons[1]] = meaning
   emoticon_hash["get_emoticon"][emoticons[0]] = emoticons[1]
 end
 emoticon_hash
# binding.pry
end

def get_japanese_emoticon(file_path = './lib/emoticons.yml', emoticon)
 emoticon_collection = load_library(file_path)
 if emoticon_collection["get_emoticon"].include?(emoticon)
   emoticon_collection["get_emoticon"][emoticon]
 else
   "Sorry, that emoticon was not found"
 end
end

def get_english_meaning(file_path = './lib/emoticons.yml', emoticon)
 emoticon_collection = load_library(file_path)
 if emoticon_collection["get_meaning"].include?(emoticon)
   emoticon_collection["get_meaning"][emoticon]
 else
   "Sorry, that emoticon was not found"
 end
end