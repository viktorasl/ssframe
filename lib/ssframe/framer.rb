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
          :text_font => './fonts/font.otf',
          :frame_name => './frames/Apple iPhone X Silver.png'
        }
      }
    end

    def self.frame_screenshot(src_path, dst_path, title, bg_color, device)
      device_config = default_config[device]
      size = device_config[:size]
      im_size = "#{size[0]}!x#{size[1]}!"
      framed_width = device_config[:framed_width]
      bottom_margin = "%+d" % device_config[:bottom_margin]
      text_center_y = device_config[:text_center_y]
      text_point_size = device_config[:text_point_size]
      text_color = device_config[:text_color]
      text_font = device_config[:text_font]
      frame_name = device_config[:frame_name]

      empty_path = File.join(Ssframe::ASSETS_DIR, "empty.png")
      frame_path = File.join(Ssframe::FRAMES_DIR, frame_name)
    end

    def self.frame(config, devices, bg_color, screenhosts_base='./screenshots/', ssframe_base='./ssframe/')
      s = ""
      for lang, titles in config do
        s += lang
        for title_config in titles do
          for f_name, title in title_config do
            for device in devices do
              src_path = File.join(screenhosts_base, lang, "#{device}-#{f_name}.png")
              dst_path = File.join(ssframe_base, lang, "#{device}-#{f_name}.png")
              frame_screenshot(src_path, dst_path, title, bg_color, device)
            end
            break
          end
        end
      end

      puts s
    end
  end
end
