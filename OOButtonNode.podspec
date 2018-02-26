Pod::Spec.new do |s|
  s.name         = "OOButtonNode"
  s.version      = "0.1"
  s.summary      = "Custom button class for SpriteKit."
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.homepage     = "https://github.com/ooleynich/OOButtonNode.git"

  s.author             = { "Oleg" => "ooleynich@gmail.com" }
  s.social_media_url   = "https://twitter.com/ooleinich"

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ooleynich/OOButtonNode.git", :tag => "#{s.version}" }
  s.source_files  = '*.swift'

  s.requires_arc = true
end
