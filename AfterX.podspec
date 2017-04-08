Pod::Spec.new do |s|
  s.name             = 'AfterX'
  s.version          = '0.2.0'
  s.summary          = 'AfterX helps you keep track of things you only want to do once, or after x amount of times, during the application lifetime'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

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
