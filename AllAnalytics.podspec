Pod::Spec.new do |s|
  s.name             = 'AllAnalytics'
  s.version          = '0.1.1'
  s.summary          = 'A framework to centralize all your analytics needs in your IOS application.'
 
  s.description      = <<-DESC
Log events to multiple Analytics SDKs in a single call. This frameworks currently works with Firebase and Fabric.
More Analytics SDK to come...
  DESC
 
  s.homepage         = 'https://github.com/otiasj/AllAnalyticsIOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Julien Saito' => 'julien.developer@gmail.com' }
  s.source           = { :git => 'https://github.com/otiasj/AllAnalyticsIOS.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'AllAnalytics/*', 'AllAnalytics/handlers/*'
 
end
