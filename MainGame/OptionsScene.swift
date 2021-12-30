//
//  OptionsScene.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/26/21.
//

import SpriteKit

class OptionsScene: SKScene {
    
    let textureAtlas = SKTextureAtlas(named: "HUD")
    
    var muteButton = SKSpriteNode()
    let sliderBase = SKSpriteNode()
    let sliderKnob = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0, y: 0)
        
        let backgroundColor = SKSpriteNode(color: .black, size: CGSize(width: self.size.width, height: self.size.height))
        backgroundColor.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(backgroundColor)
        
        let title = SKLabelNode(text: "Settings")
        title.fontName = "Copperplate"
        title.fontSize = 60
        title.position = CGPoint(x: self.size.width/2, y: self.size.height*(3/4))
        self.addChild(title)
        
        if BackgroundMusic.instance.isMuted() {
            muteButton.texture = textureAtlas.textureNamed("muteButton")
        }
        else {
            muteButton.texture = textureAtlas.textureNamed("unMuteButton")
        }
        
        muteButton.name = "muteBtn"
        muteButton.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        muteButton.size = CGSize(width: self.size.width/5, height: self.size.height/10)
        self.addChild(muteButton)
        
        sliderBase.texture = textureAtlas.textureNamed("sliderBase")
        sliderBase.position = CGPoint(x: self.size.width/2, y: self.size.height/3)
        sliderBase.size = CGSize(width: self.size.width/2, height: 4)
        sliderBase.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.addChild(sliderBase)
        
        let volume = BackgroundMusic.instance.musicPlayer.volume
        let pos = (Float) (sliderBase.position.x) * volume
        
        sliderKnob.texture = textureAtlas.textureNamed("sliderKnob")
        sliderKnob.position = CGPoint(x: CGFloat(pos), y: sliderBase.position.y)
        sliderKnob.size = CGSize(width: self.size.width/6.5, height: self.size.height/10)
        self.addChild(sliderKnob)
        sliderKnob.zPosition = 1
        
        let returnToMenu = SKLabelNode()
        returnToMenu.text = "Back to Menu"
        returnToMenu.position = CGPoint(x: self.size.width/2, y: self.size.height/5)
        returnToMenu.fontName = "Copperplate"
        returnToMenu.fontSize = self.size.width/13
        returnToMenu.name = "mnBtn"
        self.addChild(returnToMenu)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            let nodeTouched = atPoint(location)
            
            if nodeTouched.name == "muteBtn" {
                if BackgroundMusic.instance.isMuted() {
                    BackgroundMusic.instance.playMusic()
                    muteButton.texture = textureAtlas.textureNamed("unMuteButton")
                }
                else {
                    BackgroundMusic.instance.pauseMusic()
                    muteButton.texture = textureAtlas.textureNamed("muteButton")
                }
            }
            else if nodeTouched.name == "mnBtn" {
                self.view?.presentScene(MenuScene(size: self.size))
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            var xpos = location.x
            
            if xpos <= sliderBase.position.x - sliderBase.size.width/2 {
                xpos = sliderBase.position.x - sliderBase.size.width/2
            }
            else if xpos >= sliderBase.position.x + sliderBase.frame.size.width {
                xpos = sliderBase.position.x + sliderBase.size.width/2
            }
            
            sliderKnob.position = CGPoint(x: xpos, y: sliderKnob.position.y)
            let volume = (sliderKnob.position.x - (sliderBase.position.x - sliderBase.size.width/2)) / sliderBase.frame.width
            BackgroundMusic.instance.setVolume(volume: Float(volume))
        }
    }
}
