require 'json'
require_relative 'screenshots_locator'

module Ssframe
  class Framer

    def self.frame_screenshot(src_path, dst_path, text_font, title, bg_config, device_config)
      require 'mini_magick'

      size = device_config['size']
      im_size = "#{size[0]}!x#{size[1]}!"
      framed_width = device_config['framed_width']
      bottom_margin = "%+d" % device_config['bottom_margin']
      text_center_y = device_config['text_center_y']
      text_point_size = device_config['text_point_size']
      text_color = device_config['text_color']
      frame_name = device_config['frame_name']

      if bg_config.start_with?("#")
        empty_path = File.join(Ssframe::ASSETS_DIR, "empty.png")
        background = MiniMagick::Image.open(empty_path).combine_options do |i|
          i.resize im_size
          i.fill bg_config
          i.draw "color 0,0 reset"
        end
      else
        background = MiniMagick::Image.open(bg_config)
      end
      frame_path = File.join("frames", frame_name)
      frame = MiniMagick::Image.open(frame_path)

      screenshot = MiniMagick::Image.open(src_path)

      framed_screenshot = frame.composite(screenshot, "png") do |c|
        c.compose "dst-over"
        c.gravity "center"
      end
      framed_screenshot = framed_screenshot.combine_options do |i|
        i.resize "#{framed_width}x"
      end

      composed_image = background.composite(framed_screenshot, "png") do |c|
        c.compose "src-over"
        c.gravity "South"
        c.geometry "+0#{bottom_margin}"
      end

      title_image = composed_image.combine_options do |i|
        i.font text_font
        i.gravity "Center"
        i.pointsize text_point_size
        i.draw "translate 0,#{text_center_y} text 0,0 \"#{title}\""
        i.fill text_color
      end

      FileUtils.mkdir_p Pathname(dst_path).dirname.to_s
      composed_image.write(dst_path)
    end

    def self.frame(config, devices, bg_color, text_font, screenhosts_base='./screenshots/', ssframe_base='./ssframe/')
      devices_config = JSON.parse(File.read("devices.json"))

      for lang, titles in config do
        for title_config in titles do
          for f_name, title in title_config do
            for device in devices do
              src_path = File.join(screenhosts_base, lang, "#{device}-#{f_name}.png")
              dst_path = File.join(ssframe_base, lang, "#{device}-#{f_name}.png")
              frame_screenshot(src_path, dst_path, text_font, title, bg_color, devices_config[device])
            end
            break
          end
        end
      end
    end

    def self.frame_in_directory(dir, config, text_font, ssframe_base='./ssframe/')
      ssframe_config = JSON.parse(File.read("ssframe.json"))
      devices_config = JSON.parse(File.read("devices.json"))
      
      for lang, device, screen, path in Ssframe::ScreenshotsLocator.structure_in_directory(dir, devices_config) do
        dst_path = File.join(ssframe_base, lang, "#{device}-#{screen}.png")
        title = config[lang][screen]
        backgrounds_dir = ssframe_config["backgrounds_directory"]
        if !backgrounds_dir.nil?
          background = File.join(".", backgrounds_dir, device, "#{screen}.png") 
        else
          background = ssframe_config["background_color"]
        end
        frame_screenshot(path, dst_path, text_font, title, background, devices_config[device])
      end
    end
  end
end
