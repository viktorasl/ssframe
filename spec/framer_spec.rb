require "spec_helper"
require "ssframe/framer"

describe Ssframe::Framer do

  describe "frames screenshots with background" do

    config = {
      "it" => {
        "calendar" => "Calendario"
      }
    }

    before do
      expect(Ssframe::ScreenshotsLocator).to receive(:structure_in_directory).with("screens").and_return([
        ["it", "iPhone X", "calendar", "screens/path/to/screen.png"]
      ])
    end

    it "color configuration" do
      expect(File).to receive(:read).with("ssframe.json").and_return("{\"background_color\":\"#002220\"}")
      expect(Ssframe::Framer).to receive(:frame_screenshot).with(
        "screens/path/to/screen.png", "./ssframe/it/iPhone X-calendar.png", "./font.otf", "Calendario", "#002220", "iPhone X"
      ) 
      Ssframe::Framer.frame_in_directory("screens", config, "./font.otf")
    end

    it "images configuration" do
      expect(File).to receive(:read).with("ssframe.json").and_return("{\"backgrounds_directory\":\"branding\"}")
      expect(Ssframe::Framer).to receive(:frame_screenshot).with(
        "screens/path/to/screen.png", "./ssframe/it/iPhone X-calendar.png", "./font.otf", "Calendario", "./branding/iPhone X/calendar.png", "iPhone X"
      )  
      Ssframe::Framer.frame_in_directory("screens", config, "./font.otf")
    end
  end
end
