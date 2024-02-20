Pod::Spec.new do |spec|
  spec.name         = "RealSDK"
  spec.version      = "0.1.0"
  spec.summary      = "RealSDK provides functionalities for iOS applications."
  spec.description  = <<-DESC
                      RealSDK is a library for iOS that provides functionalities such as displaying advertisements and handling user interactions. It's easy to integrate into any iOS application.
                    DESC
  spec.homepage     = "http://github.com/lucaswangdev/RealSDK"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Your Name" => "your_email@example.com" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :path => "." }
  # spec.source       = { :git => 'https://github.com/lucaswangdev/RealDemo.git', :branch => 'master' }
  spec.source_files  = "RealSDK/**/*.{h,m,swift}"
  spec.frameworks = "UIKit", "Foundation"
  spec.dependency "SDWebImage", "~> 5.0"
  spec.requires_arc = true
end
