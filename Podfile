# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'AboutCanada' do
  # Comment the next line if you don't want to use dynamic frameworks
  
  # ignore all warnings from all pods
  inhibit_all_warnings!
  
  use_frameworks!
  pod 'Moya', '~> 14.0'
  pod 'SVProgressHUD', '~> 2.2'
  pod 'ReachabilitySwift', '~> 5.0'
  pod 'SwiftLint', '~> 0.42'
  pod 'SDWebImage', '~> 5.0'
  # Pods for AboutCanada

  target 'AboutCanadaTests' do
    inherit! :search_paths
    # Pods for testing
  end
  target 'AboutCanadaUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
  end
 end
end
