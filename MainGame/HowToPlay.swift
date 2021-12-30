//
//  HowToPlay.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/25/21.
//

import SpriteKit

class HowToPlay: SKScene {
    
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0, y: 0)
        
        let backgroundColor = SKSpriteNode(color: .black, size: CGSize(width: self.size.width*3, height: self.size.height*3))
        backgroundColor.zPosition = -10
        self.addChild(backgroundColor)
        
        let title = SKLabelNode()
        title.fontSize = 60
        title.text = "How To Play"
        title.fontName = "Copperplate"
        title.position = CGPoint(x: self.size.width/2, y: self.size.height/2 + 100)
        self.addChild(title)
        
        let obj = SKLabelNode()
        obj.text = "Objective:"
        obj.fontSize = 30
        obj.fontName = "Copperplate"
        obj.position.x = title.position.x - 120
        obj.position.y = title.position.y - 90
        self.addChild(obj)
        
        let objDes = SKLabelNode()
        objDes.text = "Destroy the opponent"
        objDes.fontSize = 15
        objDes.fontName = "Copperplate"
        objDes.position.x = obj.position.x + 175
        objDes.position.y = obj.position.y
        self.addChild(objDes)
        
        let rules = SKLabelNode()
        rules.text = "Rules:"
        rules.fontSize = 30
        rules.fontName = "Copperplate"
        rules.position.x = obj.position.x - 25
        rules.position.y = obj.position.y - 50
        self.addChild(rules)
        
        
        let rulesDes = SKLabelNode()
        rulesDes.text = """
        You will constantly be shooting bullets. Your main goal is to direct your bullet to shoot the opponent whilst evading their bullets. Also, damage done by the bullets you shoot are random. So keep in mind, you are never safe...
        """
        rulesDes.lineBreakMode = .byWordWrapping
        rulesDes.numberOfLines = 5
        rulesDes.preferredMaxLayoutWidth = 400
        rulesDes.verticalAlignmentMode = .top
        rulesDes.fontSize = 15
        rulesDes.fontName = "Copperplate"
        rulesDes.position.x = rules.position.x + 145
        rulesDes.position.y = rules.position.y - 10
        self.addChild(rulesDes)
        
        let backToMenu = SKLabelNode()
        backToMenu.text = "Back to Main Menu"
        backToMenu.fontName = "Copperplate"
        backToMenu.fontSize = 20
        backToMenu.position = CGPoint(x: 100, y: self.size.height/4)
        backToMenu.name = "menuBtn"
        let pulseAction = SKAction.sequence([SKAction.fadeAlpha(to: 0.5, duration: 0.5),
                                             SKAction.fadeAlpha(to: 1, duration: 0.5)])
        let pulseAnimation = SKAction.repeatForever(pulseAction)
        backToMenu.run(pulseAnimation)
        self.addChild(backToMenu)
        
        let toGameScene = SKLabelNode()
        toGameScene.text = "Play"
        toGameScene.fontSize = 20
        toGameScene.fontName = "Copperplate"
        toGameScene.position = CGPoint(x: 350, y: self.size.height/4)
        toGameScene.name = "playBtn"
        toGameScene.run(pulseAnimation)
        self.addChild(toGameScene)
        
        let topLine = SKSpriteNode(color: .white, size: CGSize(width: self.size.width, height: 3))
        topLine.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        topLine.position = CGPoint(x: self.size.width/2, y: self.size.height * (4/5))
        self.addChild(topLine)
        
        let bottomLine = SKSpriteNode(color: .white, size: CGSize(width: self.size.width, height: 3))
        bottomLine.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bottomLine.position = CGPoint(x: self.size.width/2, y: self.size.height/5)
        print(self.size.height)
        self.addChild(bottomLine)
        
        let dividerL = SKSpriteNode(color: .white, size: CGSize(width: 3, height: self.size.height/5))
        dividerL.anchorPoint = CGPoint(x: 0.5, y: 1)
        dividerL.position = CGPoint(x: self.size.width/4, y: self.size.height/5)
        self.addChild(dividerL)
        
        let dividerR = SKSpriteNode(color: .white, size: CGSize(width: 3, height: self.size.height/5))
        dividerR.anchorPoint = CGPoint(x: 0.5, y: 1)
        dividerR.position = CGPoint(x: self.size.width/2, y: self.size.height/5)
        self.addChild(dividerR)
        
        let dividerL1 = SKSpriteNode(color: .white, size: CGSize(width: 3, height: self.size.height/5))
        dividerL1.anchorPoint = CGPoint(x: 0.5, y: 1)
        dividerL1.position = CGPoint(x: self.size.width/2, y: self.size.height)
        self.addChild(dividerL1)
        
        let dividerR1 = SKSpriteNode(color: .white, size: CGSize(width: 3, height: self.size.height/5))
        dividerR1.anchorPoint = CGPoint(x: 0.5, y: 1)
        dividerR1.position = CGPoint(x: self.size.width * (3/4), y: self.size.height)
        self.addChild(dividerR1)
        
        let plyr1F = SKLabelNode()
        plyr1F.text = "Tap and hold here to move forward"
        plyr1F.lineBreakMode = .byWordWrapping
        plyr1F.numberOfLines = 5
        plyr1F.preferredMaxLayoutWidth = self.size.width/2
        plyr1F.verticalAlignmentMode = .center
        plyr1F.fontSize = 15
        plyr1F.fontName = "Copperplate"
        plyr1F.position = CGPoint(x: self.size.width*(3/4), y: self.size.height/9)
        self.addChild(plyr1F)
        
        let plyr1R = SKLabelNode()
        plyr1R.text = "Tap and hold here to rotate right (clockwise)"
        plyr1R.lineBreakMode = .byWordWrapping
        plyr1R.numberOfLines = 5
        plyr1R.preferredMaxLayoutWidth = self.size.width/4
        plyr1R.verticalAlignmentMode = .center
        plyr1R.fontSize = 15
        plyr1R.fontName = "Copperplate"
        plyr1R.position = CGPoint(x: self.size.width*(3/8), y: self.size.height/9)
        self.addChild(plyr1R)
        
        let plyr1L = SKLabelNode()
        plyr1L.text = "Tap and hold here to rotate left (counter clockwise)"
        plyr1L.lineBreakMode = .byWordWrapping
        plyr1L.numberOfLines = 5
        plyr1L.preferredMaxLayoutWidth = self.size.width/4
        plyr1L.verticalAlignmentMode = .center
        plyr1L.fontSize = 15
        plyr1L.fontName = "Copperplate"
        plyr1L.position = CGPoint(x: self.size.width*(1/8), y: self.size.height/9)
        self.addChild(plyr1L)
        
        let plyr2F = SKLabelNode()
        plyr2F.text = "Tap and hold here to move forward"
        plyr2F.lineBreakMode = .byWordWrapping
        plyr2F.numberOfLines = 5
        plyr2F.preferredMaxLayoutWidth = self.size.width/2
        plyr2F.verticalAlignmentMode = .center
        plyr2F.fontSize = 15
        plyr2F.fontName = "Copperplate"
        plyr2F.position = CGPoint(x: self.size.width/4, y: self.size.height*(8/9))
        plyr2F.zRotation = 3.14
        self.addChild(plyr2F)
        
        let plyr2R = SKLabelNode()
        plyr2R.text = "Tap and hold here to rotate right (clockwise)"
        plyr2R.lineBreakMode = .byWordWrapping
        plyr2R.numberOfLines = 5
        plyr2R.preferredMaxLayoutWidth = self.size.width/4
        plyr2R.verticalAlignmentMode = .center
        plyr2R.fontSize = 15
        plyr2R.fontName = "Copperplate"
        plyr2R.position = CGPoint(x: self.size.width*(5/8), y: self.size.height*(8/9))
        plyr2R.zRotation = 3.14
        self.addChild(plyr2R)
        
        let plyr2L = SKLabelNode()
        plyr2L.text = "Tap and hold here to rotate left (counter clockwise)"
        plyr2L.lineBreakMode = .byWordWrapping
        plyr2L.numberOfLines = 5
        plyr2L.preferredMaxLayoutWidth = self.size.width/4
        plyr2L.verticalAlignmentMode = .center
        plyr2L.fontSize = 15
        plyr2L.fontName = "Copperplate"
        plyr2L.position = CGPoint(x: self.size.width*(7/8), y: self.size.height*(8/9))
        plyr2L.zRotation = 3.14
        self.addChild(plyr2L)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            let nodetouched = atPoint(location)
            
            if nodetouched.name == "menuBtn" {
                self.view?.presentScene(MenuScene(size: self.size))
            }
            else if nodetouched.name == "playBtn" {
                self.view?.presentScene(GameScene(size: self.size))
            }
        }
    }
    
}
