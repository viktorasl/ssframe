require "ssframe/version"
require "ssframe/framer"

module Ssframe
  ASSETS_DIR = Pathname.new(File.expand_path('../assets', __FILE__))
  FRAMES_DIR = File.join(ENV['HOME'], ".ssframe")
end
