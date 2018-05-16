module Ssframe
  class FrameConfig

    def self.default()
      return {
        "iPhone X" => {
          :size => [1125, 2436],
          :framed_width => 1120,
          :bottom_margin => -120,
          :text_center_y => -1010,
          :text_point_size => 60,
          :text_color => "white",
          :frame_name => "Apple iPhone X Silver.png"
        },
        "iPhone 8" => {
          :size => [750, 1334],
          :framed_width => 660,
          :bottom_margin => -180,
          :text_center_y => -540,
          :text_point_size => 39,
          :text_color => "white",
          :frame_name => "Apple iPhone 8 Silver.png"
        },
        "iPhone 8 Plus" => {
          :size => [1242, 2208],
          :framed_width => 1124,
          :bottom_margin => -250,
          :text_center_y => -868,
          :text_point_size => 68,
          :text_color => "white",
          :frame_name => "Apple iPhone 8 Plus Silver.png"
        },
        "iPad Pro (12.9-inch)" => {
          :size => [2732, 2048],
          :framed_width => 2716,
          :bottom_margin => -136,
          :text_center_y => -862,
          :text_point_size => 60,
          :text_color => "white",
          :frame_name => "Apple iPad Pro Silver.png"
        }
      }
    end
  end
end
