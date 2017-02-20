#
# Be sure to run `pod lib lint BaseProject.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BaseProject'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BaseProject.'


  s.description      = <<-DESC
                        基础工程
                       DESC

  s.homepage         = 'https://github.com/1045908529/BaseProject'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1045908529' => 'jhtang_colin@163.com' }
  s.source           = { :git => '/Users/admin/Documents/项目/BaseProject/BaseProject', :tag => 0.1.0 }

  s.ios.deployment_target = '8.0'

  s.source_files = 'BaseProject/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'AFNetworking', '~> 3.0.3'
  s.dependency 'BlocksKit', '~> 2.2.5'
  s.dependency 'MBProgressHUD'
  s.dependency 'IQKeyboardManager'
  s.dependency 'MBProgressHUD'
  s.dependency 'Masonry', '~> 0.6.4'
  s.dependency 'MagicalRecord', '~> 2.3.2'
  s.dependency 'MJExtension', '~> 3.0.10'
  s.dependency 'TMCache', '~> 2.1.0'
end
