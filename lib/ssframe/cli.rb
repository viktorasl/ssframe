require "thor"
require "ssframe"
require "json"

module Ssframe
  class CLI < Thor
    desc "frame_in_dir DIRECTORY_PATH TEXTS", "Frame screenshots in provided directory"
    def frame_in_dir(dir, texts_config)
      config = JSON.parse(File.read(texts_config))
      Ssframe::Framer.frame_in_directory(dir, config, "font.otf")
    end
  end
end
