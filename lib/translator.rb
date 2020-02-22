require "yaml"

def load_library(path)
  yaml_hash = Hash.new
  yaml_hash["get_meaning"] = Hash.new{}
  yaml_hash["get_emoticon"] = Hash.new{}

  emoticons = YAML.load_file(path)

  emoticons.each_pair {|word, array|
      yaml_hash["get_meaning"][array.last] = word
      yaml_hash["get_emoticon"][array.first] = array.last
  }

  yaml_hash
end

def get_japanese_emoticon(path, english)
  emoticon = load_library(path)["get_emoticon"][english]
  emoticon = "Sorry, that emoticon was not found" if !emoticon
  emoticon
end

def get_english_meaning(path, japanese)
  meaning = load_library(path)["get_meaning"][japanese]
  meaning = "Sorry, that emoticon was not found" if !meaning
  meaning
end
