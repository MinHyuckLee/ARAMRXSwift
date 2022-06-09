# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rxswift
  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'
  pod 'RxDataSources', '~> 5.0'
  pod 'Moya/RxSwift', '~> 15.0'
end

def image
  pod 'Kingfisher', '~> 7.0'
end

target 'ARAMRXSwift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ARAMRXSwift

rxswift
image

  target 'ARAMRXSwiftTests' do
    inherit! :search_paths
    # Pods for testing
rxswift
image
  end

  target 'ARAMRXSwiftUITests' do
    # Pods for testing
rxswift
image
  end

end
