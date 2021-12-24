//
//  Bullet.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/23/21.
//

import SpriteKit

class Bullet: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Player")
    
    var initialSize: CGSize = CGSize(width: 45, height: 45)
    
    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/2)
        self.physicsBody?.affectedByGravity = false
        self.zPosition = -1
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.bullet.rawValue
        self.physicsBody?.contactTestBitMask =
        PhysicsCategory.player.rawValue |
        PhysicsCategory.bullet.rawValue |
        PhysicsCategory.boundary.rawValue
        self.physicsBody?.collisionBitMask =
        PhysicsCategory.player.rawValue
        
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.isDynamic = false
    }
    
    
    func onTap() {}
    
    func fireBullet1(player: Player1, scene: SKScene) {
        let bulletNode = SKSpriteNode(texture: self.textureAtlas.textureNamed("bullet1"), color: .clear, size: self.initialSize)
        bulletNode.position = player.position
        bulletNode.position.y += sin(player.zRotation)*10
        bulletNode.position.x += cos(player.zRotation)*10
        
        bulletNode.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/500)
        bulletNode.physicsBody?.mass = 0.005
        bulletNode.physicsBody?.affectedByGravity = false
        bulletNode.zRotation = player.zRotation
        
        scene.addChild(bulletNode)
        
        bulletNode.physicsBody?.applyImpulse(CGVector(dx: cos(player.zRotation), dy: sin(player.zRotation)))
        
    }
    
    func fireBullet2( player: Player2, scene: SKScene) {
        let bulletNode = SKSpriteNode(texture: self.textureAtlas.textureNamed("bullet2"), color: .clear, size: self.initialSize)
        bulletNode.position = player.position
        bulletNode.position.y += -sin(player.zRotation)*10
        bulletNode.position.x += -cos(player.zRotation)*10
        
        bulletNode.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/500)
        bulletNode.physicsBody?.mass = 0.005
        bulletNode.physicsBody?.affectedByGravity = false
        bulletNode.zRotation = player.zRotation
        
        scene.addChild(bulletNode)
        
        bulletNode.physicsBody?.applyImpulse(CGVector(dx: -cos(player.zRotation)*1, dy: -sin(player.zRotation)*1))
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
