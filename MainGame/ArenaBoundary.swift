//
//  RotateLeft.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/23/21.
//

import SpriteKit

class HorizontalBoundary: SKSpriteNode {
    
    init() {
        super.init(texture: nil, color: .blue, size: CGSize(width: 1050, height: 3))
        self.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.zPosition = -1
        
        self.physicsBody = SKPhysicsBody()
        
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.isDynamic = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

class VerticalBoundary: SKSpriteNode {
    init() {
        super.init(texture: nil, color: .blue, size: CGSize(width: 3, height: 1050))
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = -1
        
        self.physicsBody = SKPhysicsBody()
        
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.isDynamic = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
