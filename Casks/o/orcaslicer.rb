cask "orcaslicer" do
  version "2.3.1"
  sha256 "c249b58647bb85b55b0dd6560010974e9791458bb850c464c5a69f0499edb371"

  url "https://github.com/SoftFever/OrcaSlicer/releases/download/v#{version}/OrcaSlicer_Mac_universal_V#{version}.dmg"
  name "Orca Slicer"
  desc "G-code generator for 3D printers"
  homepage "https://github.com/SoftFever/OrcaSlicer"
  
  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :git do |tags, regex|
      tags.filter_map do |tag|
        match = tag.match(regex)
        next if match.blank?

        "#{match[1]},#{match[2]}"
      end
    end
  end
  
  conflicts_with cask: "orcaslicer@nightly"

  app "OrcaSlicer.app"

  zap trash: [
    "~/Library/Application Support/OrcaSlicer",
    "~/Library/Caches/com.softfever3d.orca-slicer",
    "~/Library/HTTPStorages/com.softfever3d.orcaslicer.binarycookies",
    "~/Library/Preferences/com.softfever3d.orca-slicer.plist",
    "~/Library/Saved Application State/com.softfever3d.orca-slicer.savedState",
    "~/Library/WebKit/com.softfever3d.orca-slicer",
  ]
end
