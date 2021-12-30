//
//  Bullet.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/23/21.
//

import SpriteKit
import AVFoundation

class Bullet: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Player")
    
    var initialSize: CGSize = CGSize(width: 45, height: 45)
    
    var exploded = false
    
    
    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
        
    }
    
    func onTap() {}
    
    func fireBullet1(player: Player1, scene: SKScene) {
        let bulletNode = Bullet()
        bulletNode.texture = self.textureAtlas.textureNamed("bullet1")
        bulletNode.position = player.position
        bulletNode.position.y += sin(player.zRotation)*10
        bulletNode.position.x += cos(player.zRotation)*10
        
        bulletNode.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/500)
        bulletNode.physicsBody?.mass = 0.005
        bulletNode.physicsBody?.affectedByGravity = false
        bulletNode.zRotation = player.zRotation
        
        bulletNode.physicsBody?.categoryBitMask = PhysicsCategory.bullet1.rawValue
        bulletNode.physicsBody?.contactTestBitMask =
        PhysicsCategory.boundary.rawValue |
        PhysicsCategory.bullet2.rawValue |
        PhysicsCategory.player2.rawValue
        
        scene.addChild(bulletNode)
        
        bulletNode.physicsBody?.applyImpulse(CGVector(dx: cos(player.zRotation), dy: sin(player.zRotation)))
        
    }
    
    func fireBullet2(player: Player2, scene: SKScene) {
        let bulletNode = Bullet()
        bulletNode.texture = self.textureAtlas.textureNamed("bullet2")
        bulletNode.position = player.position
        bulletNode.position.y += -sin(player.zRotation)*10
        bulletNode.position.x += -cos(player.zRotation)*10
        
        bulletNode.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/500)
        bulletNode.physicsBody?.mass = 0.005
        bulletNode.physicsBody?.affectedByGravity = false
        bulletNode.zRotation = player.zRotation
        
        bulletNode.physicsBody?.categoryBitMask = PhysicsCategory.bullet2.rawValue
        bulletNode.physicsBody?.contactTestBitMask =
        PhysicsCategory.boundary.rawValue |
        PhysicsCategory.bullet1.rawValue |
        PhysicsCategory.player1.rawValue
        
        scene.addChild(bulletNode)
        
        bulletNode.physicsBody?.applyImpulse(CGVector(dx: -cos(player.zRotation)*1, dy: -sin(player.zRotation)*1))
    }
    
    func explode(gameScene: GameScene) {
        if exploded { return }
        exploded = true
        
        gameScene.particlePool.placeEmitter(node: self, emitterType: "bullet")
        SKAction.run(SKAction.wait(forDuration: 0.5), onChildWithName: "emitter")
        
        self.run(SKAction.fadeAlpha(to: 0, duration: 0.1))
        
        self.physicsBody?.categoryBitMask = 0
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
