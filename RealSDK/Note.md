# RealSDK.podspec 创建、配置
步骤 1: 创建 Podspec 文件:

在终端中，进入到 RealSDK 的根目录。
执行 pod spec create RealSDK。这将创建一个基本的 RealSDK.podspec 文件。

打开 RealSDK.podspec 文件进行编辑，下面这2个字段的配置很重要，一定要有。
```
  spec.frameworks = "UIKit", "Foundation"
  spec.dependency "SDWebImage", "~> 5.0"
```

设置相关信息，例如：
```
Pod::Spec.new do |spec|
  spec.name         = "RealSDK"
  spec.version      = "0.1.0"
  spec.summary      = "RealSDK provides functionalities for iOS applications."
  spec.description  = <<-DESC
                      RealSDK is a library for iOS that provides functionalities such as displaying advertisements and handling user interactions. It's easy to integrate into any iOS application.
                    DESC
  spec.homepage     = "http://github.com/YourUsername/RealSDK"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Your Name" => "your_email@example.com" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :path => "." }
  spec.source_files  = "RealSDK/**/*.{h,m,swift}"
  spec.frameworks = "UIKit", "Foundation"
  spec.dependency "SDWebImage", "~> 5.0"
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

## RealSDK.podspec 初始化内容，具体需要修改（重要！！！）
```
#
#  Be sure to run `pod spec lint RealSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "RealSDK"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of RealSDK."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
                   DESC

  spec.homepage     = "http://EXAMPLE/RealSDK"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license      = "MIT (example)"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author             = { "lucaswangdev" => "lucaswang.dev@gmail.com" }
  # Or just: spec.author    = "lucaswangdev"
  # spec.authors            = { "lucaswangdev" => "lucaswang.dev@gmail.com" }
  # spec.social_media_url   = "https://twitter.com/lucaswangdev"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # spec.platform     = :ios
  # spec.platform     = :ios, "5.0"

  #  When using multiple platforms
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"
  # spec.visionos.deployment_target = "1.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "http://EXAMPLE/RealSDK.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end

```


如果您想在每次 Xcode 构建时都执行 pod install，无论 Pods 目录是否存在，您可以简化 Run Script 如下：

添加 Run Script Phase
在 Xcode 中，打开您的项目，并在 Targets 列表中选择您的应用目标。

转到 "Build Phases" 选项卡。

点击左上角的 "+" 按钮，然后选择 "New Run Script Phase"。

在新创建的 Run Script 部分中，添加以下脚本：

```bash
cd "${SRCROOT}"
echo "Installing Pods"
pod install
```

#### 打包相关
```bash
xcode-select --install

brew install rbenv ruby-build

# 安装ruby版本
rbenv install 2.7.2
rbenv global 2.7.2

# 安装 cocoapods 打包插件
gem install cocoapods-packager


# 安装1.8.4版本的 cocoapods
 sudo gem install -n /usr/local/bin cocoapods -v 1.8.4

#  https://github.com/CocoaPods/cocoapods-packager/issues/282
# update /Library/Ruby/Gems/2.6.0/gems/cocoapods-packager-1.5.0/lib/cocoapods-packager/builder.rb
def ios_build_options
      "ARCHS=\'$(ARCHS_STANDARD)\' OTHER_CFLAGS=\'-fembed-bitcode -Qunused-arguments\'"
end


pod deintegrate
pod install

```

ios-pod-package: https://www.sunmoonblog.com/2020/11/27/ios-pod-package/
【cocoapods】-cocoapods-packager打包静态库: https://www.jianshu.com/p/f35220f6f350
Xcode创建自己的静态库 .a和 .Framework: https://www.jianshu.com/p/2f2778a6fd7c

#### 手动打包相关
```
1、SDK设置DISTRIBUTION
Build Settings => BUILD_LIBRARY_FOR_DISTRIBUTION 设置为 YES

2、Schema设置
Product => Schema => Edit Scheme... => Build Configuration: release, Executable: None

3、分别在模拟器、Any iOS Device下面编译，进入到 Build 文件夹，
 xcodebuild -create-xcframework -framework ./Release-iphonesimulator/RealSDK/RealSDK.framework  -framework ./Release-iphoneos/RealSDK/RealSDK.framework -output ./RealSDK.xcframework


 xcodebuild -create-xcframework -framework ./Release-iphonesimulator/SDWebImage/SDWebImage.framework  -framework ./Release-iphoneos/SDWebImage/SDWebImage.framework -output ./SDWebImage.xcframework

4、将RealSDK.xcframework文件夹拖进App项目即可
```
参考：https://juejin.cn/post/7290375566255259687