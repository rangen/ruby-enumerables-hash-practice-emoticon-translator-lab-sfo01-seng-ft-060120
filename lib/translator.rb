require "yaml"

def load_library(path)
  yaml_hash = Hash.new
  yaml_hash["get_meaning"] = Hash.new{}
  yaml_hash["get_emoticon"] = Hash.new{}

  emoticons = YAML.load_file(path)

  emoticons.each_pair {|word, array|
      yaml_hash["get_meaning"][array.last] = array.first
      yaml_hash["get_emoticon"][array.first] = array.last
  }

  yaml_hash
end

def get_japanese_emoticon(path, english)
  return load_library(path)["get_emoticon"][english]
end

def get_english_meaning(path, japanese)
  return load_library(path)["get_meaning"][japanese]
end
