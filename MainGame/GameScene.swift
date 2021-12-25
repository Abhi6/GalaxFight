//
//  GameScene.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/22/21.
//

import SpriteKit
import GameplayKit
import Foundation

enum PhysicsCategory: UInt32 {
    case player1 = 1
    case bullet1 = 2
    case player2 = 4
    case bullet2 = 8
    case boundary = 16
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var timer1 = Timer()
    var timer2 = Timer()
    
    let player1 = Player1()
    let player2 = Player2()
    let lowerBoundary = HorizontalBoundary()
    let upperBoundary = HorizontalBoundary()
    let rightBoundary = VerticalBoundary()
    let leftBoundary = VerticalBoundary()
    let bullet1 = Bullet()
    let bullet2 = Bullet()
    let particlePool = ParticlePool()
    
    var angle: CGFloat = 0
    var angle2: CGFloat = 0
    
    
    // boolean for angular and linear movement of player1
    var touchToMoveForward1 = false
    var touchToRotateRight1 = false
    var touchToRotateLeft1 = false
    
    // boolean for angular and linear movement of player2    
    var touchToMoveForward2 = false
    var touchToRotateRight2 = false
    var touchToRotateLeft2 = false
    
    let shooting = true
    
    
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0, y: 0)
 
        player1.position = CGPoint(x: self.size.width/2, y: self.size.height/3)
        self.addChild(player1)
        
        player2.position = CGPoint(x: self.size.width/2, y: self.size.height * (2/3))
        self.addChild(player2)
        
        lowerBoundary.position = CGPoint(x: 0, y: self.size.height/5)
        lowerBoundary.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: 0), to: CGPoint(x: self.size.width, y: 0))
        lowerBoundary.position = CGPoint(x: 0, y: self.size.height / 5)
        self.addChild(lowerBoundary)
        lowerBoundary.physicsBody?.categoryBitMask = PhysicsCategory.boundary.rawValue
        lowerBoundary.physicsBody?.contactTestBitMask = PhysicsCategory.bullet1.rawValue | PhysicsCategory.bullet2.rawValue
        
        upperBoundary.position = CGPoint(x: 0, y: self.size.height * (4/5))
        upperBoundary.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: 0), to: CGPoint(x: self.size.width, y: 0))
        self.addChild(upperBoundary)
        upperBoundary.physicsBody?.categoryBitMask = PhysicsCategory.boundary.rawValue
        upperBoundary.physicsBody?.contactTestBitMask = PhysicsCategory.bullet1.rawValue | PhysicsCategory.bullet2.rawValue
        
        rightBoundary.position = CGPoint(x: self.size.width, y: self.size.height/2)
        rightBoundary.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: -self.size.height), to: CGPoint(x: 0, y: self.size.height*2))
        self.addChild(rightBoundary)
        rightBoundary.physicsBody?.categoryBitMask = PhysicsCategory.boundary.rawValue
        rightBoundary.physicsBody?.contactTestBitMask = PhysicsCategory.bullet1.rawValue | PhysicsCategory.bullet2.rawValue
        
        leftBoundary.position = CGPoint(x: 0, y: self.size.height/2)
        leftBoundary.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: -self.size.height), to: CGPoint(x: 0, y: self.size.height))
        self.addChild(leftBoundary)
        leftBoundary.physicsBody?.categoryBitMask = PhysicsCategory.boundary.rawValue
        leftBoundary.physicsBody?.contactTestBitMask = PhysicsCategory.bullet1.rawValue | PhysicsCategory.bullet2.rawValue
        
        self.timer1 = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { _ in self.bullet1.fireBullet1(player: self.player1, scene: self)})
        
        self.timer2 = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { _ in self.bullet2.fireBullet2(player: self.player2, scene: self)})

        self.physicsWorld.contactDelegate = self
        
        particlePool.addEmittersToScene(scene: self)

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let location = touch.location(in: self)

            if location.x > self.size.width / 2 &&
                location.y < self.size.height / 5 {
                touchToMoveForward1 = true
            }
            
            else if location.x < self.size.width / 4 &&
                        location.y < self.size.height / 5{
                touchToRotateLeft1 = true
            }
            
            else if location.x < self.size.width / 2 &&
                location.x > self.size.width / 4 &&
                location.y < self.size.height / 5 {
                touchToRotateRight1 = true
            }
            
            if location.x < self.size.width / 2 &&
                location.y > self.size.height * (4/5) {
                touchToMoveForward2 = true
            }
            
            else if location.x > self.size.width * (3/4) &&
                    location.y > self.size.height * (4/5) {
                touchToRotateRight2 = true
            }
            
            else if location.x > self.size.width / 2 &&
                        location.x < self.size.width * (3/4) &&
                        location.y > self.size.height * (4/5) {
                touchToRotateLeft2 = true
            }

        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if location.x > self.size.width / 2 &&
                location.y < self.size.height / 5 {
                touchToMoveForward1 = false
            }
            
            if location.x < self.size.width / 2 &&
                location.y < self.size.height / 5 {
                touchToRotateLeft1 = false
                touchToRotateRight1 = false
            }
            
            if location.x < self.size.width / 2 &&
                location.y > self.size.height * (4/5) {
                touchToMoveForward2 = false
            }
            
            if location.x > self.size.width / 2 &&
                location.y > self.size.height * (4/5) {
                touchToRotateLeft2 = false
                touchToRotateRight2 = false
            }
            
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bullet: SKPhysicsBody
        let otherBody: SKPhysicsBody
        let bulletMask = PhysicsCategory.bullet1.rawValue | PhysicsCategory.bullet2.rawValue
        if (contact.bodyA.categoryBitMask & bulletMask) > 0 {
            // body A is the bullet
            bullet = contact.bodyA
            otherBody = contact.bodyB
        }
        else {
            // body B is the bullet
            otherBody = contact.bodyA
            bullet = contact.bodyB
        }
        print("The bit mask of otherBody: \(otherBody.categoryBitMask)")
        print("The bit mask of the bullet: \(bullet.categoryBitMask)")
        
        if bullet.categoryBitMask == 2 {
            // bullet1 from player 1
            switch otherBody.categoryBitMask {
            case PhysicsCategory.boundary.rawValue:
                print("hit boundary")
                if let bullet = bullet.node as? Bullet {
                   // Call the explode function with a reference
                   // to the GameScene:
                   bullet.explode(gameScene: self)
                }
                bullet.node?.removeFromParent()
            case PhysicsCategory.bullet2.rawValue:
                print("hit bullet2")
                if let bullet = bullet.node as? Bullet {
                   // Call the explode function with a reference
                   // to the GameScene:
                   bullet.explode(gameScene: self)
                }
                bullet.node?.removeFromParent()
            case PhysicsCategory.player2.rawValue:
                player2.health -= 1
                print("hit player2")
                if player2.health == 0 {
                    print("game over")
                    player2.removeFromParent()
                }
                if let bullet = bullet.node as? Bullet {
                   // Call the explode function with a reference
                   // to the GameScene:
                   bullet.explode(gameScene: self)
                }
                bullet.node?.removeFromParent()
            default:
                print("contact with no game logic")
            }
        }
        else if bullet.categoryBitMask == 8 {
            // bullet2 from player 2
            switch otherBody.categoryBitMask {
            case PhysicsCategory.boundary.rawValue:
                if let bullet = bullet.node as? Bullet {
                   // Call the explode function with a reference
                   // to the GameScene:
                   bullet.explode(gameScene: self)
                }
                print(bullet.node as Any)
                print("hit boundary")
                bullet.node?.removeFromParent()
            case PhysicsCategory.bullet1.rawValue:
                if let bullet = bullet.node as? Bullet {
                   // Call the explode function with a reference
                   // to the GameScene:
                   bullet.explode(gameScene: self)
                }
                print("hit bullet1")
                bullet.node?.removeFromParent()
            case PhysicsCategory.player1.rawValue:
                if let bullet = bullet.node as? Bullet {
                   // Call the explode function with a reference
                   // to the GameScene:
                   bullet.explode(gameScene: self)
                }
                print("hit player1")
                player1.health -= 1
                if player1.health == 0 {
                    print("game over")
                    player1.removeFromParent()
                }
                bullet.node?.removeFromParent()
            default:
                print("contact with no game logic")
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        player1.movement(forward: touchToMoveForward1, rotateLeft: touchToRotateLeft1, rotateRight: touchToRotateRight1)
        player2.movement(forward: touchToMoveForward2, rotateLeft: touchToRotateLeft2, rotateRight: touchToRotateRight2)
                
    }
    
    
}
