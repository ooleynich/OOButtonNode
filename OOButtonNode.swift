//
//  ButtonNode.swift
//  Words
//
//  Created by Oleg on 26/10/2017.
//  Copyright © 2017 Oleg. All rights reserved.
//

import SpriteKit

enum ButtonState {
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
    
    func scale() -> CGFloat {
        switch self {
        case .normal, .disabled:
            return 1.0
        case .highlighted:
            return 0.9
        }
    }
}

final class OOButtonNode: SKNode {
    
    //MARK: Internal Properties
    var title = "" {
        didSet {
            label.text = title
        }
    }
    
    var imageNamed = "" {
        didSet {
            if let i = backgroundNode {
                i.removeFromParent()
            }
            
            backgroundNode = SKSpriteNode(imageNamed: imageNamed)
            addChild(backgroundNode!)
        }
    }
    
    var backgroundNode: SKSpriteNode? {
        didSet {
            if let oldBG = oldValue {
                oldBG.removeFromParent()
            }
        }
    }
    
    var fontSize: CGFloat = 10.0 {
        didSet {
            label.fontSize = fontSize
        }
    }
    
    var state: ButtonState! {
        didSet {
            label.fontColor = state.defaultTextColor()
            if let i = backgroundNode {
                i.xScale = state.scale()
                i.yScale = state.scale()
            }
        }
    }
    
    var pressedBlock: (() -> Void)?
    
    //MARK: Private Properties
    fileprivate let label = SKLabelNode()
    
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
        state = .highlighted
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: parent!)
            if self.contains(location) {
                pressedBlock?()
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
}
