module Ssframe
  class Framer

    def self.default_config()
      return {
        'iPhone X' => {
          :size => [1125, 2436],
          :framed_width => 1120,
          :bottom_margin => -120,
          :text_center_y => -1010,
          :text_point_size => 60,
          :text_color => 'white',
          :frame_name => 'Apple iPhone X Silver.png'
        }
      }
    end

    def self.frame_screenshot(src_path, dst_path, text_font, title, bg_color, device)
      require 'mini_magick'

      device_config = default_config[device]
      size = device_config[:size]
      im_size = "#{size[0]}!x#{size[1]}!"
      framed_width = device_config[:framed_width]
      bottom_margin = "%+d" % device_config[:bottom_margin]
      text_center_y = device_config[:text_center_y]
      text_point_size = device_config[:text_point_size]
      text_color = device_config[:text_color]
      frame_name = device_config[:frame_name]

      empty_path = File.join(Ssframe::ASSETS_DIR, "empty.png")
      background = MiniMagick::Image.open(empty_path).combine_options do |i|
        i.resize im_size
        i.fill bg_color
        i.draw "color 0,0 reset"
      end
      frame_path = File.join(Ssframe::FRAMES_DIR, frame_name)
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
      for lang, titles in config do
        for title_config in titles do
          for f_name, title in title_config do
            for device in devices do
              src_path = File.join(screenhosts_base, lang, "#{device}-#{f_name}.png")
              dst_path = File.join(ssframe_base, lang, "#{device}-#{f_name}.png")
              frame_screenshot(src_path, dst_path, text_font, title, bg_color, device)
            end
            break
          end
        end
      end
    end
  end
end
