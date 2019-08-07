def load_library(emoticon_yaml)
  require "yaml"
  
  translator = {
    get_meaning: {},
    get_emoticon: {}
  }

  emoticons = YAML.load_file(emoticon_yaml)
  emoticons.each_pair do |meaning, western_jp|
    translator[:get_meaning][western_jp[1]] = meaning
    translator[:get_emoticon][western_jp[0]] = western_jp[1]
  end

  translator
end

def get_japanese_emoticon(emoticon_yaml, emoticon)
  load_library(emoticon_yaml)[:get_emoticon][emoticon] || 'Sorry, that emoticon was not found'
end

def get_english_meaning(emoticon_yaml, emoticon)
  load_library(emoticon_yaml)[:get_meaning][emoticon] || 'Sorry, that emoticon was not found'
end