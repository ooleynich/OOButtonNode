# OOButtonNode

[![CocoaPods compatible](https://img.shields.io/cocoapods/v/MBProgressHUD.svg?style=flat)]() [![License: MIT](https://img.shields.io/cocoapods/l/MBProgressHUD.svg?style=flat)](http://opensource.org/licenses/MIT) 
[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social&logo=twitter)](https://twitter.com/ooleinich)


`OOButtonNode` custom button class for SpriteKit. It has almost all usefull logic from UIButton.

## Requirements

`OOButtonNode` works on iOS 8+ and requires ARC to build. It depends only in adding SpriteKit.

## Adding OOButtonNode to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add OOButtonNode to your project.

1. Add a pod entry for MBProgressHUD to your Podfile `pod 'OOButtonNode'
2. Install the pod(s) by running `pod install`.
3. Include MBProgressHUD wherever you need it with `import OOButtonNode`.

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

Additionaly You can change font and button size(specially for background color using)

All this logic is in example project.

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).