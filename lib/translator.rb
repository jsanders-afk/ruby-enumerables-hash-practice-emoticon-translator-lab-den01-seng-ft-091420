require "yaml"
require 'pry'
emoticons = YAML.load_file("./lib/emoticons.yml")

def load_library(emoticons)
  emoticons = YAML.load_file("./lib/emoticons.yml")
  eng = []
  jap = []
  emoticons.each do |emot_name, the_emotes|
    the_emotes.each_with_index do |item,index| 
      if (index %2 ==0) then 
      eng.push(item)
      else
      jap.push(item)
      end
    end
  end
  ultimate = emoticons.each_with_object({}) do |(emot_name, the_emotes), big_hash|
    big_hash[emot_name] = {}
    big_hash[emot_name] = {:english => eng[big_hash.length - 1], :japanese => jap[big_hash.length - 1]}
  end
  ultimate
end


def get_english_meaning(emoticons, emote)
  p emote
  load_library(emoticons).find do |emotname, eoj|
    load_library(emoticons)[emotname][:japanese] == emote
  end
end
binding.pry


 

#eoj.find do |lan, sym|
#      load_library(emoticons)[eoj][sym] == emote
#    end





def get_japanese_emoticon
end



