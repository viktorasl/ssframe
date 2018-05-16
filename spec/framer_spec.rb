require "spec_helper"
require "ssframe/framer"

describe Ssframe::Framer do

  it "frames screenshots with correct configuration" do
    expect(Ssframe::ScreenshotsLocator).to receive(:structure_in_directory).with("screens").and_return([
      ["it", "iPhone X", "calendar", "screens/path/to/screen.png"]
    ])
    expect(Ssframe::Framer).to receive(:frame_screenshot).with(
      "screens/path/to/screen.png", "./ssframe/it/iPhone X-calendar.png", "./font.otf", "Calendario", "#002220", "iPhone X"
    )
    config = {
      "it" => {
        "calendar" => "Calendario"
      }
    }
    Ssframe::Framer.frame_in_directory("screens", config, "#002220", "./font.otf")
  end
end
