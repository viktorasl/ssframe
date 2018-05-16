require "spec_helper"
require "ssframe/screenshots_locator"

describe Ssframe::ScreenshotsLocator do

  it "handles correctly empty directory" do
    expect(
      Ssframe::ScreenshotsLocator.structure_in_directory("spec/fixtures")
    ).to eq([])
  end
end
