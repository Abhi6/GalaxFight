//
//  GameViewController.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/22/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if let scene = SKScene(fileNamed: "GameScene") {
//                // set the scale mode fit to the window
//                scene.scaleMode = .aspectFill
//                // size our scene to fit the view
//                scene.size = view.bounds.size
//                // show the new scene
//                view.presentScene(scene)
//
//
//            }
//            view.ignoresSiblingOrder = true
//            view.showsFPS = true
//            view.showsNodeCount = true
//        }
//
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let menuScene = MenuScene()
        let skView = self.view as! SKView
        
        skView.ignoresSiblingOrder = true
        
        menuScene.size = view.bounds.size
        
        skView.presentScene(menuScene)
        
        BackgroundMusic.instance.playBackgroundMusic()
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
