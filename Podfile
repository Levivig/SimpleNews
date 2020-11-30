# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

inhibit_all_warnings!

target 'SimpleNews' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Template
  pod 'Alamofire'
  # pod 'Crashlytics'
  # pod 'Fabric'
  # pod 'Firebase/Analytics'
  # pod 'SDWebImage'
  pod 'SnapKit'
  pod 'SwifterSwift'
  pod 'SwiftLint'
  pod 'SwiftyBeaver'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if Gem::Version.new(config.build_settings['IPHONEOS_DEPLOYMENT_TARGET']) < Gem::Version.new('12.0')
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end
end