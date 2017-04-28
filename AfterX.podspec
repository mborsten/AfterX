Pod::Spec.new do |s|
  s.name             = 'AfterX'
  s.version          = '0.4.0'
  s.summary          = 'Do something once, after x amount of times'
  s.description      = <<-DESC
AfterX is ideal for keeping track of onboarding, tips, etc. Want to show a tip the first time a user sees a view?: `AfterX.doOnce()`. Want to ask the user for a glaring review after succeeding a task 5 times?: `AfterX.do(task: "once_after_five", after: 5) { self.askForReview() }`
                       DESC

  s.homepage         = 'https://github.com/mborsten/AfterX'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Marcel Borsten' => 'marcel@impart.nl' }
  s.source           = { :git => 'https://github.com/mborsten/AfterX.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mborsten'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AfterX/Classes/**/*'
end
