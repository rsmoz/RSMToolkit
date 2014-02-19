Pod::Spec.new do |s|
  s.name         = "RSMToolkit"
  s.version      = "0.0.5"
  s.summary      = "Personal toolkit"
  s.homepage     = "https://github.com/rsmoz/RSMToolkit"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Robert Mozayeni" => "dev@mozayeni.com" }
  s.source       = { 
    :git => "https://github.com/rsmoz/RSMToolkit.git", 
    :tag => "0.0.4"
  }

  s.platform     = :ios, '6.1'
  s.source_files = 'RSMToolkit/*.{h,m}'
  s.requires_arc = true
end