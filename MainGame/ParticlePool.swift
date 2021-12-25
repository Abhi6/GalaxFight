//
//  ParticlePool.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/24/21.
//

import SpriteKit


class ParticlePool {
    var bulletPool: [SKEmitterNode] = []
    var bulletIndex = 0
    
    var gameScene = SKScene()
    
    init() {
        for i in 1...50 {
            let bullet = SKEmitterNode(fileNamed: "BulletExplosion")!
            
            bullet.position = CGPoint(x: -5000, y: -5000)
            bullet.zPosition = CGFloat(100-i)
            bullet.name = "bullet"+String(i)
            
            bulletPool.append(bullet)
        }
    }
    
    func addEmittersToScene(scene: GameScene) {
        self.gameScene = scene
        
        for i in 0..<bulletPool.count {
            self.gameScene.addChild(bulletPool[i])
        }
    }
    
    func placeEmitter(node: SKNode, emitterType: String) {
        var emitter: SKEmitterNode
        switch emitterType {
        case "bullet":
            emitter = bulletPool[bulletIndex]
            
            bulletIndex += 1
            
            if bulletIndex >= bulletPool.count {
                bulletIndex = 0
            }
        default:
            return
        }
        
        var absolutePosition = node.position
        if node.parent != gameScene {
            absolutePosition = gameScene.convert(node.position, from: node.parent!)
        }
        
        emitter.position = absolutePosition
        
        emitter.resetSimulation()
        
        
    }
    
    

    
}
