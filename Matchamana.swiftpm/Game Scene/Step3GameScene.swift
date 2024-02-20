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

    var chasenNode = SKSpriteNode()
    var bowlNode = SKSpriteNode()

    var leftHitzone = SKShapeNode()
    var rightHitzone = SKShapeNode()

    var atLeft = false
    var atRight = false

    var leftCounter = 0
    var rightCounter = 0

    var selectedNode: SKSpriteNode?
    var originalChasenPosition: CGPoint!

    override func didMove(to view: SKView) {
        backgroundColor = .white

        tableNode = TableNode(size: CGSize(width: size.width, height: 20))
        tableNode.position = CGPoint(x: size.width / 2, y: size.height / 2 - 150)
        addChild(tableNode)

        addBowlNode()
        addChasenNode()
        createHitZone()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        let touchLocation = touch.location(in: self)
        let touchedNodes = nodes(at: touchLocation)

        if let node = touchedNodes.first as? SKSpriteNode {
            if node == chasenNode {
                selectedNode = chasenNode
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let selectedNode = selectedNode else { return }

        let touchLocation = touch.location(in: self)
        selectedNode.position = touchLocation

        if leftHitzone.contains(touchLocation) {
            if !atLeft {
//                leftHitzone.fillColor = .cyan
                atLeft = true
                atRight = false
//                rightHitzone.fillColor = .red
                leftCounter += 1
            }
        }

        if rightHitzone.contains(touchLocation) {
            if !atRight {
//                rightHitzone.fillColor = .purple
                atRight = true
                atLeft = false
//                leftHitzone.fillColor = .green
                rightCounter += 1
            }
        }

        if leftCounter >= 9 && rightCounter >= 9 {
            bowlNode.texture = SKTexture(imageNamed: "Bowl Done 3 \(Matchamana.shared.powder.rawValue)")
        } else if leftCounter >= 6 && rightCounter >= 6 {
            bowlNode.texture = SKTexture(imageNamed: "Bowl Done 2")
        } else if leftCounter >= 3 && rightCounter >= 3 {
            bowlNode.texture = SKTexture(imageNamed: "Bowl Done 1")
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if selectedNode != nil {
            chasenNode.position = originalChasenPosition
        }
        selectedNode = nil

        if leftCounter >= 9 && rightCounter >= 9 {
            Matchamana.shared.step3Done = true
        }
    }

    func addBowlNode() {
        let bowlTexture = SKTexture(imageNamed: "Bowl Done")

        let aspectRatio = bowlTexture.size().height / bowlTexture.size().width
        let bowlWidth: CGFloat = 360
        let bowlHeight = bowlWidth * aspectRatio

        bowlNode = SKSpriteNode(texture: bowlTexture, size: CGSize(width: bowlWidth, height: bowlHeight))
        bowlNode.position = CGPoint(
            x: tableNode.position.x - 100,
            y: tableNode.position.y + 75)
        addChild(bowlNode)
    }

    func addChasenNode() {
        let bowlTexture = SKTexture(imageNamed: "Chasen")

        let aspectRatio = bowlTexture.size().height / bowlTexture.size().width
        let bowlWidth: CGFloat = 120
        let bowlHeight = bowlWidth * aspectRatio

        chasenNode = SKSpriteNode(texture: bowlTexture, size: CGSize(width: bowlWidth, height: bowlHeight))
        chasenNode.position = CGPoint(
            x: bowlNode.position.x + 280,
            y: tableNode.position.y + 75)
        originalChasenPosition = chasenNode.position
        addChild(chasenNode)
    }

    func createHitZone() {
        let hitZoneSize = CGSize(width: 50, height: 150)
        leftHitzone = SKShapeNode(rectOf: hitZoneSize)
        rightHitzone = SKShapeNode(rectOf: hitZoneSize)

        leftHitzone.position = CGPoint(
            x: bowlNode.position.x - 80,
            y: bowlNode.position.y)
        rightHitzone.position = CGPoint(
            x: bowlNode.position.x + 150,
            y: bowlNode.position.y)

        leftHitzone.zPosition = -1
        rightHitzone.zPosition = -1

        addChild(leftHitzone)
        addChild(rightHitzone)
    }
}
