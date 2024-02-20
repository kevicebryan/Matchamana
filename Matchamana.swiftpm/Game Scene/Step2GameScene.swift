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
    var hitZoneNode: SKShapeNode!

    var originalPowderPosition: CGPoint!
    var originalVanillaPosition: CGPoint!
    var originalWaterPosition: CGPoint!

    override func didMove(to view: SKView) {
        backgroundColor = .white
        tableNode = TableNode(size: CGSize(width: size.width, height: 20))
        tableNode.position = CGPoint(x: size.width / 2, y: size.height / 2 - 150)

        addChild(tableNode)
        addBowlNode()
        addPowderNode()
        addVanillaNode()
        addWaterNode()
        createHitZone()
    }

    override func update(_ currentTime: TimeInterval) {}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        let touchLocation = touch.location(in: self)
        let touchedNodes = nodes(at: touchLocation)

        if let node = nodes(at: touchLocation).first as? SKSpriteNode {
            if node == bowlNode {
                selectedNode = nil
            }
            else if touchedNodes.contains(tableNode) || touchedNodes.contains(where: { tableNode.contains($0) }) {
                selectedNode = nil
            }
            else {
                selectedNode = node
            }
        }

//        print(selectedNode?.name)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let selectedNode = selectedNode else { return }

        let touchLocation = touch.location(in: self)
        selectedNode.position = touchLocation

//        print(selectedNode.name)

        if hitZoneNode.contains(touchLocation) {
            if selectedNode == powderNode && !addedPowder {
                addedPowder = true
                rotateNode(selectedNode, by: 20)
                runRotateBackAction(selectedNode)
            }
            else if selectedNode == vanillaNode && !addedVanilla {
                addedVanilla = true
                rotateNode(selectedNode, by: 20)
                runRotateBackAction(selectedNode)
                vanillaNode.texture = SKTexture(imageNamed: "Vanilla Empty")
            }
            else if selectedNode == waterNode && !addedWater {
                addedWater = true
                rotateNode(selectedNode, by: 20)
                runRotateBackAction(selectedNode)
                waterNode.texture = SKTexture(imageNamed: "Water Empty")
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let selectedNode = selectedNode {
            switch selectedNode {
            case powderNode:
                powderNode.position = originalPowderPosition
            case vanillaNode:
                vanillaNode.position = originalVanillaPosition
            case waterNode:
                waterNode.position = originalWaterPosition
            default:
                break
            }
        }
        selectedNode = nil
    }

//    MARK: UPDATES LOGIC

    func updateBowl() {
        if addedWater && addedPowder && addedVanilla {
            bowlNode.texture = SKTexture(imageNamed: "Bowl Done")
            Matchamana.shared.step2Done = true
        }
        else if addedWater && addedPowder {
            bowlNode.texture = SKTexture(imageNamed: "Bowl Water Powder")
        }
        else if addedWater && addedVanilla {
            bowlNode.texture = SKTexture(imageNamed: "Bowl Water Vanilla")
        }
        else if addedPowder && addedVanilla {
            bowlNode.texture = SKTexture(imageNamed: "Bowl Powder Vanilla")
        }
        else if addedWater {
            bowlNode.texture = SKTexture(imageNamed: "Bowl Water")
        }
        else if addedPowder {
            bowlNode.texture = SKTexture(imageNamed: "Bowl Powder")
        }
        else if addedVanilla {
            bowlNode.texture = SKTexture(imageNamed: "Bowl Vanilla")
        }
    }

//    MARK: ROTATE INGREDIENT

    func rotateNode(_ node: SKSpriteNode, by angle: CGFloat) {
        let rotateAction = SKAction.rotate(byAngle: angle * (.pi / 180), duration: 0.25)
        node.run(rotateAction)
    }

    func runRotateBackAction(_ node: SKSpriteNode) {
        let rotateBackAction = SKAction.rotate(toAngle: 0, duration: 0.5)
        node.run(SKAction.sequence([SKAction.wait(forDuration: 0.4), rotateBackAction]))

        updateBowl()
    }

//    MARK: INITIALIZATION

    func addBowlNode() {
        let bowlTexture = SKTexture(imageNamed: "Bowl Empty")

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
        powderNode.name = "Powder"
        originalPowderPosition = powderNode.position
        addChild(powderNode)
    }

    func addVanillaNode() {
        let vanillaTexture = SKTexture(imageNamed: "Vanilla")
        let aspectRatio = vanillaTexture.size().height / vanillaTexture.size().width
        let vanillaWidth: CGFloat = 50
        let vanillaHeight = vanillaWidth * aspectRatio

        vanillaNode = SKSpriteNode(texture: vanillaTexture, size: CGSize(width: vanillaWidth, height: vanillaHeight))
        vanillaNode.position = CGPoint(
            x: tableNode.position.x + 130,
            y: tableNode.position.y + 25)
        vanillaNode.name = "Vanilla"
        originalVanillaPosition = vanillaNode.position
        addChild(vanillaNode)
    }

    func addWaterNode() {
        let waterTexture = SKTexture(imageNamed: "Water")
        let aspectRatio = waterTexture.size().height / waterTexture.size().width
        let waterWidth: CGFloat = 75
        let waterHeight = waterWidth * aspectRatio

        waterNode = SKSpriteNode(texture: waterTexture, size: CGSize(width: waterWidth, height: waterHeight))
        waterNode.position = CGPoint(
            x: tableNode.position.x + 225,
            y: tableNode.position.y + 45)
        waterNode.name = "Water"
        originalWaterPosition = waterNode.position
        addChild(waterNode)
    }

    func createHitZone() {
        let hitZoneSize = CGSize(width: 300, height: 150)
        hitZoneNode = SKShapeNode(rectOf: hitZoneSize)
        hitZoneNode.position = CGPoint(x: bowlNode.position.x,
                                       y: bowlNode.position.y + 120)
        hitZoneNode.zPosition = -1
        addChild(hitZoneNode)
    }
}
