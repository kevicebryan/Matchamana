//
//  Step3GameScene.swift
//  Matchamana
//
//  Created by Kevin Bryan on 20/02/24.
//

import SpriteKit
import SwiftUI

class Step3GameScene: SKScene {
    var tableNode: TableNode!

    override func didMove(to view: SKView) {
        backgroundColor = .white

        tableNode = TableNode(size: CGSize(width: size.width, height: 20))
        tableNode.position = CGPoint(x: size.width / 2, y: size.height / 2 - 150)
        addChild(tableNode)
    }
}
