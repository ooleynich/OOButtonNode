//
//  ButtonNode.swift
//  Words
//
//  Created by Oleg on 26/10/2017.
//  Copyright © 2017 Oleg. All rights reserved.
//

import SpriteKit

public enum OOButtonState {
    case normal
    case pressed
    case disabled
    
    func defaultTextColor() -> UIColor {
        switch self {
        case .normal:
            return UIColor.blue
        case .pressed:
            return UIColor.white
        case .disabled:
            return UIColor.gray
        }
    }
}

final public class OOButtonNode: SKNode {
    
    //MARK: Public Properties
    public var size = CGSize.zero {
        didSet {
            resizeBackground()
        }
    }
    
    public var font = UIFont.systemFont(ofSize: 10.0) {
        didSet {
            label.fontName = font.fontName
            label.fontSize = font.pointSize
        }
    }
    
    public var pressedScale: CGFloat = 1.0
    
    public var pressedBlock: ((OOButtonNode) -> Void)?
    
    public var enabled = true {
        didSet {
            enabledChanged()
        }
    }
    
    //MARK: Private Properties
    fileprivate var state = OOButtonState.normal {
        didSet {
            stateChanged()
        }
    }
    
    fileprivate var titles = [OOButtonState: String]()
    fileprivate var titleColors = [OOButtonState: UIColor]()
    fileprivate var backgrounds = [OOButtonState: SKSpriteNode]()
    
    fileprivate let label = SKLabelNode()
    fileprivate var backgroundNode: SKSpriteNode? {
        didSet {
            if let oldBG = oldValue {
                oldBG.removeFromParent()
            }
        }
    }
    
    //MARK: Public Methods
    public func setTitle(_ title: String, for state: OOButtonState) {
        titles[state] = title
        updateLabel()
    }
    
    public func setTitleColor(_ titleColor: UIColor, for state: OOButtonState) {
        titleColors[state] = titleColor
        updateLabel()
    }
    
    public func setBackgroundColor(_ backgroundColor: UIColor, for state: OOButtonState) {
        let node = SKSpriteNode(color: backgroundColor, size:  size)
        node.zPosition = -100.0
        backgrounds[state] = node
        updateBackground()
    }
    
    public func setImage(_ image: UIImage, for state: OOButtonState) {
        let node = SKSpriteNode(texture: SKTexture(image: image))
        node.zPosition = -100.0
        backgrounds[state] = node
        updateBackground()
    }
    
    //MARK: Lifecycle
    public override init() {
        super.init()
        
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        state = .pressed
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: parent!)
            if self.contains(location) {
                pressedBlock?(self)
            }
        }
        
        state = .normal
    }
}

fileprivate extension OOButtonNode {
    
    func setupUI() {
        isUserInteractionEnabled = true
        label.verticalAlignmentMode = .center
        addChild(label)
        state = .normal
    }
    
    func stateChanged() {
        updateLabel()
        updateBackground()
    }
    
    func updateLabel() {
        label.text = titles[state] ?? titles[.normal] ?? ""
        label.fontColor = titleColors[state] ?? state.defaultTextColor()
    }
    
    func updateBackground() {
        if let background = backgrounds[state], background != backgroundNode {
            backgroundNode = background
            addChild(backgroundNode!)
            changeScale()
        } else if backgrounds[.normal] != nil {
            changeScale()
        }
    }
    
    func resizeBackground() {
        backgrounds.values.forEach { $0.size = size }
    }
    
    func changeScale() {
        let newScale = state == .pressed ? pressedScale : 1.0
        backgroundNode?.xScale = newScale
        backgroundNode?.yScale = newScale
    }
    
    func enabledChanged() {
        isUserInteractionEnabled = enabled
        state = enabled ? .normal : .disabled
    }
}
