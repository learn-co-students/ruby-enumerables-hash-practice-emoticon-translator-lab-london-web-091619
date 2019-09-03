require "yaml"

def load_library(file)
  emoticons_hash = YAML.load_file(file)
  final_hash = {:get_meaning => {}, :get_emoticon => {}}
  
  emoticons_hash.each_pair { |name, emoticon|
    final_hash[:get_meaning][emoticon[1]] = name
    final_hash[:get_emoticon][emoticon[0]] = emoticon[1]
  }  
  
  return final_hash
end

def get_japanese_emoticon(file, emoticon)
  new_hash = load_library(file)
  sad_message = "Sorry, that emoticon was not found"
  
  new_hash[:get_emoticon].each_pair { |english_emoticon, japanese_emoticon| 
    if new_hash[:get_emoticon].has_key?(emoticon) == false then
      return sad_message
    elsif english_emoticon == emoticon then
      return japanese_emoticon 
    end 
  }
end

def get_english_meaning(file, emoticon)
  new_hash = load_library(file)
  sad_message = "Sorry, that emoticon was not found"
  
  new_hash[:get_meaning].each_pair { |japanese_emoticon, english_name| 
    if new_hash[:get_meaning].has_key?(emoticon) == false then
      return sad_message
    elsif japanese_emoticon == emoticon then
      return english_name
    end 
  }
end


