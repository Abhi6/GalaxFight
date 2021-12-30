//
//  MenuScene.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/24/21.
//

import SpriteKit

class MenuScene: SKScene {
    
    var startButton = SKSpriteNode()
    var optionsButton = SKSpriteNode()
    var howToPlay = SKLabelNode()
    var options = SKLabelNode()
    
    let textureAtlas = SKTextureAtlas(named: "HUD")
    
    var readyScene = SKSpriteNode()

    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0, y: 0)
        
        print(self.size)
        
        let backgroundImage = SKSpriteNode(imageNamed: "StartMenu")
        backgroundImage.size = CGSize(width: self.size.width, height: self.size.height)
        backgroundImage.zPosition = -10
        backgroundImage.position = CGPoint(x: self.size.width/2, y: self.size.height*(3/4))
        
        let backgroundColor = SKSpriteNode(texture: nil, color: .black, size: CGSize(width: self.size.width, height: self.size.height))
        backgroundColor.zPosition = -10
        backgroundColor.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        
        if let backgroundEmitter = SKEmitterNode(fileNamed: "StartMenuParticle") {
            self.addChild(backgroundEmitter)
            backgroundEmitter.targetNode = self
            backgroundEmitter.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        }
        
        startButton = SKSpriteNode(texture: textureAtlas.textureNamed("playButton"), color: .clear, size: CGSize(width: self.size.width/3, height: self.size.height/7))
        startButton.position = CGPoint(x: self.size.width/2, y: self.size.height*(4/20))
        startButton.zPosition = 10
        startButton.name = "playBtn"
        let pulseAction = SKAction.sequence([SKAction.fadeAlpha(to: 0.5, duration: 0.5),
                                             SKAction.fadeAlpha(to: 1, duration: 0.5)])
        let pulseAnimation = SKAction.repeatForever(pulseAction)
        startButton.run(pulseAnimation)
        self.addChild(startButton)
        
        howToPlay.fontColor = .white
        howToPlay.fontName = "Copperplate"
        howToPlay.fontSize = self.size.width/26
        howToPlay.text = "How To Play"
        howToPlay.name = "Instructions"
        howToPlay.position = CGPoint(x: self.size.width*(8/10), y: self.size.height/20)
        
        options.fontColor = .white
        options.fontName = "Copperplate"
        options.fontSize = self.size.width/26
        options.text = "Go to Settings"
        options.name = "settings"
        options.position.x = self.size.width*(1/5)
        options.position.y = howToPlay.position.y
        
        self.addChild(backgroundColor)
        self.addChild(backgroundImage)
        self.addChild(howToPlay)
        self.addChild(options)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            let nodeTouched = atPoint(location)
            
            if nodeTouched.name == "playBtn" {
                self.view?.presentScene(GameScene(size: self.size))
            }
            else if nodeTouched.name == "Instructions" {
                self.view?.presentScene(HowToPlay(size: self.size))
            }
            else if nodeTouched.name == "settings" {
                self.view?.presentScene(OptionsScene(size: self.size))
            }
        }
    }
    
    
    
}
