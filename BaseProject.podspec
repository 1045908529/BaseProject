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
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1045908529' => 'jhtang_colin@163.com' }
  s.source           = { :git => 'https://github.com/1045908529/BaseProject.git', :tag => '0.1.0' }

  s.ios.deployment_target = '8.0'

  s.source_files = 'BaseProject/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'BlocksKit', '~> 2.2.5'
  s.dependency 'MBProgressHUD'
end
