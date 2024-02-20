//
//  Step2GameScene.swift
//  Matchamana
//
//  Created by Kevin Bryan on 20/02/24.
//

import SpriteKit
import SwiftUI

class Step2GameScene: SKScene {
    var tableNode: TableNode!

    var bowlNode = SKSpriteNode()
    var waterNode = SKSpriteNode()
    var vanillaNode = SKSpriteNode()
    var powderNode = SKSpriteNode()

    var addedPowder = false
    var addedVanilla = false
    var addedWater = false

    var selectedNode: SKSpriteNode?

    override func didMove(to view: SKView) {
        backgroundColor = .white
        tableNode = TableNode(size: CGSize(width: size.width, height: 20))
        tableNode.position = CGPoint(x: size.width / 2, y: size.height / 2 - 150)

        addChild(tableNode)
        addBowlNode()
        addPowderNode()
        addVanillaNode()
        addWaterNode()
    }

    override func update(_ currentTime: TimeInterval) {}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        let touchLocation = touch.location(in: self)
        let touchedNodes = nodes(at: touchLocation)

        if let node = nodes(at: touchLocation).first as? SKSpriteNode {
            if node == bowlNode {
                selectedNode = nil
            } else if touchedNodes.contains(tableNode) || touchedNodes.contains(where: { tableNode.contains($0) }) {
                selectedNode = nil
            } else {
                selectedNode = node
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let selectedNode = selectedNode else { return }

        let touchLocation = touch.location(in: self)
        selectedNode.position = touchLocation
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        selectedNode = nil
    }

    func addBowlNode() {
        let bowlTexture = SKTexture(imageNamed: "Bowl")
        let aspectRatio = bowlTexture.size().height / bowlTexture.size().width
        let bowlWidth: CGFloat = 250
        let bowlHeight = bowlWidth * aspectRatio

        bowlNode = SKSpriteNode(texture: bowlTexture, size: CGSize(width: bowlWidth, height: bowlHeight))
        bowlNode.position = CGPoint(
            x: tableNode.position.x - 170,
            y: tableNode.position.y + 65)

        addChild(bowlNode)
    }

    func addPowderNode() {
        let powderTexture = SKTexture(imageNamed: "Matcha Box Opened \(Matchamana.shared.powder.rawValue)")
        let aspectRatio = powderTexture.size().height / powderTexture.size().width
        let powderWidth: CGFloat = 100
        let powderHeight = powderWidth * aspectRatio

        powderNode = SKSpriteNode(texture: powderTexture, size: CGSize(width: powderWidth, height: powderHeight))
        powderNode.position = CGPoint(
            x: tableNode.position.x + 20,
            y: tableNode.position.y + 55)

        addChild(powderNode)
    }

    func addVanillaNode() {
        let powderTexture = SKTexture(imageNamed: "Vanilla")
        let aspectRatio = powderTexture.size().height / powderTexture.size().width
        let powderWidth: CGFloat = 50
        let powderHeight = powderWidth * aspectRatio

        powderNode = SKSpriteNode(texture: powderTexture, size: CGSize(width: powderWidth, height: powderHeight))
        powderNode.position = CGPoint(
            x: tableNode.position.x + 130,
            y: tableNode.position.y + 25)

        addChild(powderNode)
    }

    func addWaterNode() {
        let powderTexture = SKTexture(imageNamed: "Water")
        let aspectRatio = powderTexture.size().height / powderTexture.size().width
        let powderWidth: CGFloat = 75
        let powderHeight = powderWidth * aspectRatio

        powderNode = SKSpriteNode(texture: powderTexture, size: CGSize(width: powderWidth, height: powderHeight))
        powderNode.position = CGPoint(
            x: tableNode.position.x + 225,
            y: tableNode.position.y + 45)

        addChild(powderNode)
    }
}
