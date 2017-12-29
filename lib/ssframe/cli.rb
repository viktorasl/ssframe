require "thor"
require "ssframe"
require "json"

module Ssframe
  class CLI < Thor

    desc "frame TEXTS", "Frames screenshots into frames with promo texts"
    def frame(texts_json)
      titles_config = JSON.parse(texts_json)
      Ssframe::Framer.frame(titles_config, ['iPhone X'], "#b50039", "font.otf")
    end
  end
end
