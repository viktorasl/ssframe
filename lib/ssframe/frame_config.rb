module Ssframe
  class FrameConfig

    def self.default()
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
  end
end
