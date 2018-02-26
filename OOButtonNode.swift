//
//  ButtonNode.swift
//  Words
//
//  Created by Oleg on 26/10/2017.
//  Copyright © 2017 Oleg. All rights reserved.
//

import SpriteKit

enum OOButtonState {
    case normal
    case highlighted
    case disabled
    
    func defaultTextColor() -> UIColor {
        switch self {
        case .normal:
            return UIColor.blue
        case .highlighted:
            return UIColor.white
        case .disabled:
            return UIColor.gray
        }
    }
}

final class OOButtonNode: SKNode {
    
    //MARK: Internal Properties
    var size = CGSize.zero {
        didSet {
            resizeBackground()
        }
    }
    
    var font = UIFont.systemFont(ofSize: 10.0) {
        didSet {
            label.fontName = font.fontName
            label.fontSize = font.pointSize
        }
    }
    
    var highlightScale: CGFloat = 1.0
    
    var pressedBlock: ((OOButtonNode) -> Void)?
    
    var enabled = true {
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
    
    //MARK: Internal Methods
    func setTitle(_ title: String, for state: OOButtonState) {
        titles[state] = title
        updateLabel()
    }
    
    func setTitleColor(_ titleColor: UIColor, for state: OOButtonState) {
        titleColors[state] = titleColor
        updateLabel()
    }
    
    func setBackgroundColor(_ backgroundColor: UIColor, for state: OOButtonState) {
        let node = SKSpriteNode(color: backgroundColor, size:  size)
        node.zPosition = -100.0
        backgrounds[state] = node
        updateBackground()
    }
    
    func setImage(_ image: UIImage, for state: OOButtonState) {
        let node = SKSpriteNode(texture: SKTexture(image: image))
        node.zPosition = -100.0
        backgrounds[state] = node
        updateBackground()
    }
    
    //MARK: Lifecycle
    override init() {
        super.init()
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if state == .disabled {
            return
        }
        
        state = .highlighted
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if state == .disabled {
            return
        }
        
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
        let newScale = state == .highlighted ? highlightScale : 1.0
        backgroundNode?.xScale = newScale
        backgroundNode?.yScale = newScale
    }
    
    func enabledChanged() {
        isUserInteractionEnabled = enabled
        state = enabled ? .normal : .disabled
    }
}
