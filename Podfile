# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'RxMvvmSwiftExample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # ignore all warnings from all pods
  inhibit_all_warnings!

  # Network
  pod 'Himotoki'
  pod 'Alamofire'
  
  # Rx
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxOptional'
  pod 'SVProgressHUD'

  # UI
  pod 'Spring', :git => 'https://github.com/MengTo/Spring.git'
  pod 'SDWebImage', '~> 4.0'
  
  # DI
  pod 'Swinject'
  pod 'SwinjectStoryboard'
  
  # Pods for RxMvvmSwiftExample
  target 'RxMvvmSwiftExampleTests' do
    inherit! :search_paths
    pod 'Quick'
    pod 'Nimble'
  end

  target 'RxMvvmSwiftExampleUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
