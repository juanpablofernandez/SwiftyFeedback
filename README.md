# SwiftyFeedback
> A lightweight pure-Swift library that allows users to send feedback.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![CocoaPods](https://img.shields.io/cocoapods/v/SwiftyFeedback.svg)](https://cocoapods.org/pods/SwiftyFeedback)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyFeedback.svg?style=flat)](https://cocoapods.org/pods/SwiftyFeedback)


SwiftyFeedback is a lightweight pure-Swift library based on the [CTFeedback](https://github.com/rizumita/CTFeedback) library.

SwiftyFeedback makes it easy to add a simple feedback template to any of your apps.

![](Screenshots/screenshot1.PNG)

## Contents

* [Requirements](#requirements)
* [Installation](#installation)
    * [CocoaPods](#cocoapods)
    * [Manually](#manually)
* [Usage](#usage)
* [Notes](#notes)
* [Contribute](#contribute)
* [License](#license)

## Requirements

- iOS 9.0+
- Xcode 7.3+
- Swift 4.0+

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `SwiftyFeedback` by adding this to your `Podfile`:

```ruby
use_frameworks!
pod 'SwiftyFeedback'
```
If you get the ``Unable to find a specification for `SwiftyFeedback`.``  error after running `pod install`.

Run the following commands on your project directory:
```
pod repo update
```
```
pod install
```
#### Manually
1. Drag and drop ```SwiftyFeedback.swift``` and the rest of the ```.swift``` files into your project.  
2. That's it!

## Usage
1. Import `SwiftyFeedback` module to your `AppDelegate` class
```swift
import SwiftyFeedback
```
2. In your `AppDelegate` class, add the recipients array to the SwiftyFeedback singleton.
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        SwiftyFeedback.shared.recipients = ["test@gmail.com"]
        return true
}
```
3. Import `SwiftyFeedback` module to your `ViewController` class
```swift
import SwiftyFeedback
```
4. Present the `SwiftyFeedback` view on your `ViewController` e.g.
```swift
class ViewController: UIViewController {

        @IBAction func contactTapped(_ sender: Any) {
            SwiftyFeedback.shared.present(self)
        }
}
```
5. `SwiftyFeedback` works with default implementation. Override it to customize its behavior

<!-- [Example project with CocoaPods](https://github.com/juanpablofernandez). -->

## Notes
* Landscape mode is not supported

## Contribute
Contributions are welcomed! There are however certain guidelines you must follow when you contribute:
* Have descriptive commit messages.
* Make a pull request for every feature (Don't make a pull request that adds 3 new features. Make an individual pull request for each of those features, with a descriptive message).
* Don't update the example project, or any other irrelevant files.


## License

Distributed under the MIT license. See ``LICENSE`` for more information.

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
