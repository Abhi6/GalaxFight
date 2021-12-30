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
    var playerPool1: [SKEmitterNode] = []
    var playerIndex1 = 0
    var playerPool2: [SKEmitterNode] = []
    var playerIndex2 = 0
    
    var gameScene = SKScene()
    
    init() {
        for i in 1...50 {
            let bullet = SKEmitterNode(fileNamed: "BulletExplosion")!
            
            bullet.position = CGPoint(x: -5000, y: -5000)
            bullet.zPosition = CGFloat(100-i)
            bullet.name = "bullet"+String(i)
            
            bulletPool.append(bullet)
        }
        
        for i in 1...3 {
            let player = SKEmitterNode(fileNamed: "PlayerExplosion1")
            
            player!.position = CGPoint(x: -6000, y: -6000)
            player!.zPosition = CGFloat(100-i)
            player!.name = "player"+String(i)
            
            playerPool1.append(player!)
        }
        
        for i in 1...3 {
            let player = SKEmitterNode(fileNamed: "PlayerExplosion2")
            
            player!.position = CGPoint(x: -6000, y: -6000)
            player!.zPosition = CGFloat(100-i)
            player!.name = "player"+String(i)
            
            playerPool2.append(player!)
        }
    }
    
    func addEmittersToScene(scene: GameScene) {
        self.gameScene = scene
        
        for i in 0..<bulletPool.count {
            self.gameScene.addChild(bulletPool[i])
        }
        
        for i in 0..<playerPool1.count {
            self.gameScene.addChild(playerPool1[i])
        }
        
        for i in 0..<playerPool2.count {
            self.gameScene.addChild(playerPool2[i])
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
        case "player1":
            emitter = playerPool1[playerIndex1]
            
            playerIndex1 += 1
            
            if playerIndex1 >= playerPool1.count {
                playerIndex1 = 0
            }
        case "player2":
            print(playerIndex2)
            emitter = playerPool2[playerIndex2]
            
            playerIndex2 += 1
            
            if playerIndex2 >= playerPool2.count {
                playerIndex2 = 0
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
