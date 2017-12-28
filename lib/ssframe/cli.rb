require "thor"
require "ssframe"

module Ssframe
  class CLI < Thor

    desc "frame", "Frames screenshots into frames with promo text"
    def frame()
      puts Ssframe::Framer.frame()
    end
  end
end
