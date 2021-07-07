require "yaml"

def load_library(file_path)
  emoji_sheet = YAML.load_file(file_path)
  japanese_meaning = {}
  western_to_japanese = {}
  emoji_sheet.each do |meaning, emojis|
    japanese_meaning[emojis.last] = meaning
    western_to_japanese[emojis.first] = emojis.last
  end
  hash = {"get_emoticon" => western_to_japanese, "get_meaning" => japanese_meaning}
end

def get_japanese_emoticon(file_path, emoticon)
  emoji_library = load_library(file_path)
  emoji_equivalent = emoji_library["get_emoticon"][emoticon]
  return "Sorry, that emoticon was not found" if emoji_equivalent.nil?
  emoji_equivalent
end

def get_english_meaning(file_path, emoticon)
  emoji_library = load_library(file_path)
  emoji_equivalent = emoji_library["get_meaning"][emoticon]
  return "Sorry, that emoticon was not found" if emoji_equivalent.nil?
  emoji_equivalent
end
