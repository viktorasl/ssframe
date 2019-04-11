require "ssframe/version"
require "ssframe/framer"
require "pathname"

module Ssframe
  ASSETS_DIR = Pathname.new(File.expand_path('../assets', __FILE__))
end
