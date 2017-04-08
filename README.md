# AfterX

[![Version](https://img.shields.io/cocoapods/v/AfterX.svg?style=flat)](http://cocoapods.org/pods/AfterX)
[![License](https://img.shields.io/cocoapods/l/AfterX.svg?style=flat)](http://cocoapods.org/pods/AfterX)
[![Platform](https://img.shields.io/cocoapods/p/AfterX.svg?style=flat)](http://cocoapods.org/pods/AfterX)

AfterX uses the UserDefaults to keep track of tasks you have performed before. It keeps track of the tasks using the task identifier you give.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

When you want to do something only once during the lifetime of the app:
```swift
  AfterX.doOnce(task: "button_hint") {
    self.showHint()
  }
```

When you want to do something once after the user has performed a task an x amount of times:
```swift
  func calledWhenSucceedingTask() {

    ...
    
    AfterX.do(task: "ask_for_review", after: 5) {
      self.askForReview()
    }
  }
```

You can reset the count for a task:
```swift
  AfterX.resetCount("my_task")
```

Or reset the count for all tasks:
```swift
  AfterX.resetAll()
```

## Requirements

## Installation

AfterX is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AfterX"
```

## Author

Marcel Borsten, marcel@impart.nl

## License

AfterX is available under the MIT license. See the LICENSE file for more info.
