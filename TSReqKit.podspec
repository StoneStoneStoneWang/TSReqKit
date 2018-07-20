
Pod::Spec.new do |s|

s.name         = "TSReqKit"
s.version      = "1.1.3"
s.summary      = "A Lib For Req."
s.description  = <<-DESC
TSReqKit 是一个网络请求封装
DESC

s.homepage     = "https://github.com/StoneStoneStoneWang/TSReqKit"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"

s.requires_arc = true

s.frameworks = 'UIKit', 'Foundation'

s.source       = { :git => "https://github.com/StoneStoneStoneWang/TSReqKit.git", :tag => "#{s.version}" }

s.source_files = "Code/**/*.{h,m}"

s.dependency 'AFNetworking'

s.dependency 'MJExtension'

s.dependency 'YYCache'

end

