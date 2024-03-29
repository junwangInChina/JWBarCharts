
Pod::Spec.new do |s|

  s.name         = "JWBarChart"
  s.version      = "0.3.7"
  s.summary      = "一款自用的柱状图"

  s.homepage     = "https://github.com/junwangInChina/JWBarCharts"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "wangjun" => "578382239@qq.com" }

  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/junwangInChina/JWBarCharts.git", :tag => "#{s.version}" }
  s.source_files  = "JWBarCharts/JWBarCharts/JWBarCharts/**/*.{h,m}"


  s.frameworks   =  'UIKit'

  s.requires_arc = true

  s.dependency "Masonry"

end
