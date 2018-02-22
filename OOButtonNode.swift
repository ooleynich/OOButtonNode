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
    
    var pressedBlock: (() -> Void)?
    
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
        backgroundColors[state] = backgroundColor
        updateLabel()
    }
    
    func setImage(_ image: UIImage, for state: OOButtonState) {
        images[state] = image
        updateImage()
    }
    
    //MARK: Private Properties
    fileprivate var state = OOButtonState.normal {
        didSet {
            stateChanged()
        }
    }
    
    fileprivate var titles = [OOButtonState: String]()
    fileprivate var titleColors = [OOButtonState: UIColor]()
    fileprivate var backgroundColors = [OOButtonState: UIColor]()
    fileprivate var images = [OOButtonState: UIImage]()
    
    fileprivate let label = SKLabelNode()
    fileprivate var backgroundNode: SKSpriteNode? {
        didSet {
            if let oldBG = oldValue {
                oldBG.removeFromParent()
            }
        }
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
    
    func stateChanged() {
        updateLabel()
        updateImage()
    }
    
    func updateLabel() {
        label.text = titles[state] ?? titles[.normal] ?? ""
        label.fontColor = titleColors[state] ?? state.defaultTextColor()
    }
    
    func updateImage() {
        if let image = images[state] ?? images[.normal] {
            backgroundNode = SKSpriteNode(texture: SKTexture(image: image))
            addChild(backgroundNode!)
            
            let newScale = state == .highlighted ? highlightScale : 1.0
            backgroundNode?.xScale = newScale
            backgroundNode?.yScale = newScale
        } else if let backgroundColor = backgroundColors[state] {
            let bn = SKSpriteNode(color: backgroundColor, size:  size)
            bn.zPosition = -100.0
            addChild(bn)
            backgroundNode = bn
        }
    }
    
    func resizeBackground() {
        if let bn = backgroundNode {
            bn.size = size
        }
    }
}
