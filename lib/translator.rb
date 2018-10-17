# require modules here
require 'yaml'
def load_library(path)
  emotes = YAML.load_file(path)
  
  out = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }
  
  emotes.each do |_, emote|
    out["get_emoticon"][emote[0]] = emote[1]
  end
  
  emotes.each do |key, emote|
    out["get_meaning"][emote[1]] = key.to_s
  end
  
  out
end

def get_japanese_emoticon(path, emoticon)
  emotes = load_library(path)
  if emotes["get_emoticon"].has_key?(emoticon)
    emotes["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emotes = load_library(path)
  if emotes["get_meaning"].has_key?(emoticon)
    emotes["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end