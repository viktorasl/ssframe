require "thor"
require "ssframe"
require "json"
require "frameit"

module Ssframe
  class CLI < Thor

    desc "frame TEXTS", "Frames screenshots into frames with promo texts"
    def frame(texts_json)
      titles_config = JSON.parse(texts_json)
      Ssframe::Framer.frame(titles_config, ['iPhone X'], "#b50039", "font.otf")
    end

    desc "frame_in_dir DIR_PATH TEXTS", """
    Frames screenshots in provided directory where screenshots appear contained in localization directories
    """
    def frame_in_dir(dir, texts_config)
      config = JSON.parse(File.read(texts_config))
      Ssframe::Framer.frame_in_directory(dir, config, "font.otf")
    end

    desc "download_frames", """
    Downloads device frames
    """
    def download_frames
      Frameit::FrameDownloader.new.download_frames
    end
  end
end
