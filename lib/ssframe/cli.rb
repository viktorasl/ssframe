require "thor"
require "ssframe"

module Ssframe
  class CLI < Thor

    desc "frame", "Frames screenshots into frames with promo text"
    def frame()
      titles_config = {
        "en-GB" => [
          {"2-calendar" => "Stay up to date with your\nwhole salon's calendar"}
        ],
        "de-DE" => [
          {"2-calendar" => "Mit dem gesamten Kalender\nbehalten Sie immer den Überblick"}
        ]
      }
      Ssframe::Framer.frame(titles_config, ['iPhone X'], "#69c748", "font.otf")
    end
  end
end
