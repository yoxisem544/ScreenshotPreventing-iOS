Pod::Spec.new do |s|
  s.name = "ScreenshotPreventing"
  s.version = "1.1.0"
  s.summary = "Prevent screenshot or screenrecord on iOS devices"
  s. description = <<-EOS
  ScreenshotPreventing can help you to wrap views 
  you do not want user to screenshot or record.

  RxSwift extensions exist as wll.
  EOS

  s.homepage = "https://github.com/yoxisem544/ScreenshotPreventing-iOS"
  s.license = { "type => "MIT", :file => "License.md" }
  s.author = { "David Liying Lin" => "yoxisem544@gmail.com" }
  s.social_media_url = "https://twitter.com/yoxisem544"
  s.ios.deployment_target = "12.0"
  s.source = { :git => "https://github.com/yoxisem544/ScreenshotPreventing-iOS.git", :tag => s.version }
  s.default_subspec = "Core"
  s.swift_version = "5.3"
  s.cocoapods_version = '>= 1.4.0

  s.subspec "Core" do |ss|
    ss.source_files = "Sources/ScreenshotPreventing/"
    ss.framework = "Foundation"
    ss.framework = "UIKit"
  end

  s.subspec "RxSwift" do |ss|
    ss.source_files = "Sources/RxScreenshotPreventing/"
    ss.dependency "RxSwift", "~> 6.0"
  end
end