require "spec_helper"
require "ssframe/screenshots_locator"

describe Ssframe::ScreenshotsLocator do

  it "handles correctly empty directory" do
    expect(
      Ssframe::ScreenshotsLocator.structure_in_directory("spec/fixtures")
    ).to eq([])
  end

  it "returns correct structure for a given path" do
    expect(
      Ssframe::ScreenshotsLocator.structure_in_directory("spec/fixtures/screens")
    ).to match_array([
      ["de-DE", "iPhone X", "calendar", "spec/fixtures/screens/de-DE/iPhone X-calendar.png"],
      ["de-DE", "iPhone X", "employee", "spec/fixtures/screens/de-DE/iPhone X-employee.png"],
      ["it", "iPhone X", "calendar", "spec/fixtures/screens/it/iPhone X-calendar.png"]
    ])
  end
end
