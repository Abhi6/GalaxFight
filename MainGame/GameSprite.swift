//
//  GameSprite.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/22/21.
//

import SpriteKit

protocol GameSprite {
    var textureAtlas : SKTextureAtlas {get set}
    var initialSize : CGSize {get set}
    func onTap()
}
