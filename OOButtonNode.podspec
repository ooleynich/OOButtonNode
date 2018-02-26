Pod::Spec.new do |s|
  s.name         = "OOButtonNode"
  s.version      = "0.2"
  s.summary      = "Custom button class for SpriteKit."
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = "https://github.com/ooleynich"

  s.author             = { "Oleg" => "ooleynich@gmail.com" }
  s.social_media_url   = "http://twitter.com/ooleinich"

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ooleynich/OOButtonNode.git", :tag => "#{s.version}" }
  s.source_files  = '*.swift'
  s.swift_version = '4.0'

  s.requires_arc = true
end
