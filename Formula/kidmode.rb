class Kidmode < Formula
  desc "Toddler keyboard sandbox — colorful visual and audio feedback from keyboard mashing"
  homepage "https://github.com/tdiderich/kidmode"
  url "https://github.com/tdiderich/kidmode.git", tag: "v0.1.0"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}")
  end

  def caveats
    <<~EOS
      kidmode requires Accessibility permissions for your terminal app.
      Go to: System Settings → Privacy & Security → Accessibility
      and enable your terminal (Terminal.app, iTerm2, etc.)

      To exit kidmode, type: adulttakeover
    EOS
  end

  test do
    assert_match "kidmode: must be run in a terminal", shell_output("#{bin}/kidmode 2>&1", 1)
  end
end
