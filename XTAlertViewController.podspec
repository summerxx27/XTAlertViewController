#  valid spec and to remove all comments including this before submitting the sp
Pod::Spec.new do |s|
s.name = 'XTAlertViewController'
s.version = '1.0.7'
s.license = 'MIT'
s.summary = 'An view like UIAlertViewController on iOS.'
s.homepage = 'https://github.com/summerxx27/XTAlertViewController'
s.authors = { 'summerxx27' => '1005430006@qq.com' }
s.source = { :git => 'https://github.com/summerxx27/XTAlertViewController.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = 'XTAlertViewController/XTAlertView.h'

s.subspec 'Tool' do |ss|
    	ss.source_files = 'XTAlertViewController/Tool/*.{h,m}'    		
	end
s.subspec 'View' do |view|
    	view.source_files = 'XTAlertViewController/View/*.{h,m}'    	
	end
s.subspec 'Controller' do |c|
    	c.source_files = 'XTAlertViewController/Controller/*.{h,m}'    	
	end

end


