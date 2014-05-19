Pod::Spec.new do |s|
  s.name         = "GKBlocks"
  s.version      = "0.0.1"
  s.summary      = "UIActionSheet + UIAlertView with Blocks"

  s.description  = <<-DESC
                   Adds blocks support to UIActionSheet and UIAlertView
                   DESC

  s.homepage     = "http://github.com/gekitz/GKBlocks"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Georg Kitz" => "georgkitz@gmail.com" }
  s.social_media_url   = "http://twitter.com/gekitz"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/gekitz/GKBlocks.git", :tag => "0.0.1" }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.requires_arc = true

  subspec "Twitter" do |sp|
    sp.source_files = "Classes/Twitter"
  end

  subspec "Pinboard" do |sp|
    sp.source_files = "Classes/Pinboard"
  end
end
