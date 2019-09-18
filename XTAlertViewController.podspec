#  valid spec and to remove all comments including this before submitting the sp
Pod::Spec.new do |s|
s.name = 'XTAlertViewController'
s.version = '1.0.2'
s.license = 'MIT'
s.summary = 'An view like UIAlertViewController on iOS.'
s.homepage = 'https://github.com/summerxx27/XTAlertViewController'
s.authors = { 'summerxx27' => '1005430006@qq.com' }
s.source = { :git => 'https://github.com/summerxx27/XTAlertViewController.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = 'XTAlertViewController/*'

end

spec.subspec 'Tool' do |util|
   util.source_files = 'XTAlertViewController/Tool/**/*'
end

spec.subspec 'Controller' do |controller|
   controller.source_files = 'XTAlertViewController/Controller/**/*'
end

spec.subspec 'View' do |view|
   view.source_files = 'XTAlertViewController/View/**/*'
end

