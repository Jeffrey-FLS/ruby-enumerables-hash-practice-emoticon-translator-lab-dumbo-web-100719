
require 'pry'
require "yaml"


def load_library(lib_file_path)
  translated_lib = {}

  emoticons_lib = YAML.load_file(lib_file_path)

  translated_lib = {:get_meaning => {}, :get_emoticon => {}}

  emoticons_lib.each do |emotion, expression|
    translated_lib[:get_meaning][expression[1]] = emotion
    translated_lib[:get_emoticon][expression[0]] = expression[1]

    # binding.pry

  end

  translated_lib
end

def get_japanese_emoticon(lib_file_path, emoticon)
  lib = load_library(lib_file_path)
  result = lib[:get_emoticon].select { |eng_emoticon, jap_emoticon| eng_emoticon === emoticon}

  if result[emoticon]
    return result[emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(lib_file_path, emoticon)
  lib = load_library(lib_file_path)
  result = lib[:get_meaning].select { |jap_emoticon, eng_meaning | jap_emoticon === emoticon}
  
  if result[emoticon]
    return result[emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end