Pod::Spec.new do |s|

  s.name                  = "SwiftyFeedback"
  s.version               = "1.0.0"
  s.summary               = "A lightweight framework that allows users to contact developers."
  s.description           = <<-DESC
SwiftyFeedback makes it easy to add a contact screen to any of your apps. This allows users to contact you through email, all in a lightweight framework.
                            DESC
  s.homepage              = "https://github.com/juanpablofernandez/SwiftyFeedback"
  s.license               = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author                = "Juan Pablo Fernandez"
  s.social_media_url      = "https://github.com/juanpablofernandez"
  s.ios.deployment_target = '9.0'
  s.source                = { :git => "https://github.com/juanpablofernandez/SwiftyFeedback.git", :tag => "#{s.version}" }
  s.source_files          = "SwiftyFeedback", "SwiftyFeedback/**/*.{swift}"
  s.swift_version = '4.0'

end
