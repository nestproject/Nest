Pod::Spec.new do |spec|
  spec.name = 'Nest'
  spec.version = '0.2.1'
  spec.summary = 'Swift Web Server Gateway Interface.'
  spec.homepage = 'https://github.com/nestproject/'
  spec.license = { :type => 'BSD', :file => 'LICENSE' }
  spec.author = { 'Kyle Fuller' => 'kyle@fuller.li' }
  spec.social_media_url = 'http://twitter.com/kylefuller'
  spec.source = { :git => 'https://github.com/nestproject/Nest.git', :tag => spec.version }
  spec.source_files = 'Sources/Nest.swift'
  spec.requires_arc = true
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
end

