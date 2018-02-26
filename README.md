# OOButtonNode

![platform ios](http://b.repl.ca/v1/platform-ios-lightgrey.png) ![Swift 4.0](http://b.repl.ca/v1/Swift-4.0-blue.png) [![CocoaPods compatible](http://b.repl.ca/v1/pod-1.4.0-blue.png)]() [![License: MIT](http://b.repl.ca/v1/License-MIT-lightgrey.png)](LICENSE) 
[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social&logo=twitter)](https://twitter.com/ooleinich)


`OOButtonNode` custom button class for SpriteKit. It has almost all useful logic from UIButton.

![Alt Text](https://user-images.githubusercontent.com/9960447/36678749-a2270014-1b22-11e8-96a9-0f4aba84bcf1.gif)

## Requirements

`OOButtonNode` is Swift 4 library, works on iOS 8+ and requires ARC to build.

## Adding OOButtonNode to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add OOButtonNode to your project.

1. Add a pod entry for OOButtonNode to your Podfile `pod 'OOButtonNode'
2. Install the pod(s) by running `pod install`.
3. Include OOButtonNode wherever you need it with `import OOButtonNode`.

### Source files

Alternatively you can directly add the `OOButtonNode.swift` source file to your project.

1. Download the [latest code version](https://github.com/ooleynich/OOButtonNode/archive/master.zip) or add the repository as a git submodule to your git-tracked project.
2. Open your project in Xcode, then drag and drop `OOButtonNode.swift` onto your project (use the "Product Navigator view").

## Usage

You can create OOButtonNode programmatically or via `*.sks` file, for callback we use `pressedBlock`:

```swift
let firstButton = childNode(withName: "firstButton") as! OOButtonNode
firstButton.pressedBlock = { (buttonNode) in
    NSLog("firstButton pressed")
}

let fourthButton = OOButtonNode()
addChild(fourthButton)
```

You can set text and text color onto the button:

```swift
firstButton.setTitle("Hello", for: .normal)
firstButton.setTitleColor(.black, for: .normal)
```

Or You can use images or background colors for button states:

```swift
firstButton.setImage(UIImage(named: "hello")!, for: .normal)
firstButton.setImage(UIImage(named: "hello_pressed")!, for: .pressed)

fourthButton.setBackgroundColor(.yellow, for: .normal)
fourthButton.setBackgroundColor(.red, for: .pressed)
fourthButton.setBackgroundColor(.lightGray, for: .disabled)
```

Moreover You can add scale effect to the pressed state:

```swift
firstButton.pressedScale = 0.9
```

Additionally You can change font and button size(specially for background color using)

All this logic is in example project.

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).