module Ssframe
  class Framer
    def self.frame()
      empty_path = File.join(Ssframe::ASSETS_DIR, "empty.png")
      frames_path = FRAMES_DIR

      puts frames_path
    end
  end
end
