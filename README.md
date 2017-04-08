# AfterX

[![Version](https://img.shields.io/cocoapods/v/AfterX.svg?style=flat)](http://cocoapods.org/pods/AfterX)
[![License](https://img.shields.io/cocoapods/l/AfterX.svg?style=flat)](http://cocoapods.org/pods/AfterX)
[![Platform](https://img.shields.io/cocoapods/p/AfterX.svg?style=flat)](http://cocoapods.org/pods/AfterX)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


```swift
  AfterX.doOnce(task: "button_hint") {
    self.showHint()
  }
```

```swift
  func calledWhenSucceedingTask() {

    ...
    
    AfterX.do(task: "ask_for_review", after: 5) {
      self.askForReview()
    }
  }
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
