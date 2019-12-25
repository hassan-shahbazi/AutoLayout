Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.name         = "AutoLayoutSwift"
  spec.version      = "1.0"
  spec.summary      = "The library provides an easy approach to auto layout features programmatically."
  spec.description  = <<-DESC
  Written in Swift 5.0 and useful for iOS versions later than 9.0, the library provides an easy approach to auto layout features programmatically.
  Provides functions for setting top, left, right, bottom, trailing, leading, width, and height constrainsts.
  Provides functions for removing (deactivating) currently set constraints (either by code, or storyboard)
                   DESC
  spec.homepage     = "https://github.com/Hassaniiii/AutoLayout"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.author             = { "Hassan Shahbazi" => "h-shahbazi@hotmail.com" }
  spec.social_media_url   = "https://www.linkedin.com/in/hassanshahbazi/"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.platform     = :ios, "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source       = { :git => "https://github.com/Hassaniiii/AutoLayout.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.subspec "AutoLayout" do |s|
    s.source_files  = "AutoLayout/**/*.{swift}"
  end
end
