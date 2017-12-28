module Ssframe
  class Framer
    def self.frame()
      empty_path = File.join(Ssframe::ASSETS_DIR, "empty.png")
      puts empty_path
    end
  end
end
