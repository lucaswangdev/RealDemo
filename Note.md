
步骤 1: 创建 Podspec 文件:

在终端中，进入到 RealSDK 的根目录。
执行 pod spec create RealSDK。这将创建一个基本的 RealSDK.podspec 文件。
编辑 Podspec 文件:

打开 RealSDK.podspec 文件进行编辑。
设置相关信息，例如：
```
Pod::Spec.new do |spec|
  spec.name         = "RealSDK"
  spec.version      = "0.1.0"
  spec.summary      = "A short description of RealSDK."
  spec.description  = <<-DESC
                      RealSDK is a framework for displaying ads in iOS apps.
                      DESC
  spec.homepage     = "http://EXAMPLE/RealSDK"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Your Name" => "your@email.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :path => "." }  # 由于是本地路径，使用当前目录
  spec.source_files = "RealSDK/**/*.{h,m,swift}"
  spec.requires_arc = true
end
```

保存文件。
这里 spec.source 设置为 { :path => "." } 指的是 RealSDK 的源代码位于 podspec 文件所在的目录。
确保 spec.source_files 匹配你的源文件路径。
保存这个文件。

步骤 2: 在 RealDemo 项目中添加 RealSDK 依赖
在 RealDemo 项目的根目录下，确保有一个 Podfile。如果没有，可以通过运行 pod init 命令来创建一个。

编辑 Podfile，添加对 RealSDK 的本地路径依赖。例如：

```ruby
platform :ios, '9.0'

target 'RealDemo' do
  use_frameworks!

  # 本地路径依赖
  pod 'RealSDK', :path => './RealSDK'
end
```

这里 :path => './RealSDK' 指向 RealSDK 的本地目录路径。根据你的文件结构，这个路径可能需要相应调整。
保存 Podfile。

步骤 3: 安装依赖
在终端中，导航到 RealDemo 项目的根目录。
运行 pod install 命令来安装依赖项。
安装完成后，确保通过 .xcworkspace 文件打开你的 RealDemo 项目。
步骤 4: 使用 RealSDK
在 RealDemo 项目中，你现在可以像使用其他 CocoaPods 依赖一样使用 RealSDK。

注意事项
确保 RealSDK.podspec 中的版本号、摘要、描述、主页和授权信息正确无误。
如果 RealSDK 更新了代码或 podspec 文件，你需要在 RealDemo 项目中运行 pod update RealSDK 以获取最新的更改。