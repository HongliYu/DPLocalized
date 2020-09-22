Pod::Spec.new do |s|

  s.name         = "DPLocalized"
  s.version      = "0.1.0"
  s.summary      = "Change languages inside the app, no need to wait the screen to reboot any more"

  s.description  = <<-DESC
                    Changing language from system costs too much time, we should do it from inside. Easy for QA to test translations
                    DESC

  s.homepage     = "https://github.com/HongliYu/DPLocalized"
  s.license      = "MIT"
  s.author       = { "HongliYu" => "yhlssdone@gmail.com" }
  s.source       = { :git => "https://github.com/HongliYu/DPLocalized.git", :tag => "#{s.version}" }

  s.platform     = :ios, "12.0"
  s.requires_arc = true
  s.source_files = "Sources/DPLocalized/"
  s.frameworks   = 'UIKit', 'Foundation'
  s.module_name  = 'DPLocalized'
  s.swift_version = "5.3"

end