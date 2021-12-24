//
//  Player2.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/23/21.
//

import Foundation

import SpriteKit

class Player2: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Player")
    
    var initialSize: CGSize = CGSize(width: 50, height: 50)
    
    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
        self.texture = textureAtlas.textureNamed("player2")
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height/4.55)
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.affectedByGravity = false
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.player.rawValue
        self.physicsBody?.contactTestBitMask =
        PhysicsCategory.player.rawValue |
        PhysicsCategory.bullet.rawValue
        self.physicsBody?.collisionBitMask =
        PhysicsCategory.player.rawValue |
        PhysicsCategory.boundary.rawValue |
        PhysicsCategory.bullet.rawValue
        
    }
    
    
    func onTap() {}
    
    func movement(forward: Bool, rotateLeft: Bool, rotateRight: Bool) {
        if forward && rotateLeft {
            self.zRotation -= 0.2
            self.physicsBody?.applyForce(CGVector(dx: -cos(self.zRotation)*10, dy: -sin(self.zRotation)*10))
        }
        
        else if forward && rotateRight {
            self.zRotation += 0.2
            self.physicsBody?.applyForce(CGVector(dx: -cos(self.zRotation)*10, dy: -sin(self.zRotation)*10))
        }
        
        else if forward {
            self.physicsBody?.applyForce(CGVector(dx: -cos(self.zRotation)*10, dy: -sin(self.zRotation)*10))
        }
        
        else if rotateLeft {
            self.zRotation -= 0.2
        }
        
        else if rotateRight {
            self.zRotation += 0.2
        }
        
        else if !forward {
            self.physicsBody?.linearDamping = 3
        }
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
