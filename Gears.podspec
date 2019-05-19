#
# Be sure to run `pod lib lint Gears.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name             = 'Gears'
  spec.version          = '1.4.0'
  spec.summary          = 'A bootstrapping framework in Swift with useful extensions and helpful utils.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  spec.description      = 'A bootstrapping framework in Swift with useful extensions and helpful utils. This helps with productivity and faster developments of apps.'

  spec.homepage         = 'https://github.com/candidcod3r/Gears'
  # spec.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'candidcod3r' => 'candidcod3r@gmail.com' }
  spec.source           = { :git => 'https://github.com/candidcod3r/Gears.git', :tag => spec.version.version }
  # spec.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  spec.platform           = :ios, '11.0'
  spec.swift_version      = '5.0'
  spec.source_files       = 'Sources/**/*.swift'
  
  spec.ios.deployment_target = '8.0'
  spec.ios.frameworks        = 'Foundation', 'CoreGraphics', 'UIKit'
  spec.ios.exclude_files     = [
  ]

  spec.prefix_header_contents = '
    #import <Foundation/Foundation.h>
    #import <CoreGraphics/CoreGraphics.h>
    #import <UIKit/UIKit.h>'

  # spec.resource_bundles = {
  #   'Gears' => ['Gears/Assets/*.png']
  # }

  # spec.public_header_files = 'Pod/Classes/**/*.h'
  # spec.frameworks = 'UIKit', 'MapKit'
  # spec.dependency 'Alamofire'
end
