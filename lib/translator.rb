# require modules here
require "yaml"


def load_library(filepath)
  # code goes here
  new_emotes = {"get_emoticon" => {}, "get_meaning" => {}}
  emotes = YAML.load_file(filepath)

  emotes.each do |key, value|
    new_emotes["get_emoticon"][value[0]] = emotes[key][1]
    new_emotes["get_meaning"][value[1]] = key
  end

  new_emotes
end

def get_japanese_emoticon(filepath, emote)
  # code goes here
  translation = load_library(filepath)["get_emoticon"][emote]
  if translation
    return translation
  else
return "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(filepath, emote)
  # code goes here
  translation = load_library(filepath)["get_meaning"][emote]
  if translation
    return translation
  else
return "Sorry, that emoticon was not found"
  end
end
