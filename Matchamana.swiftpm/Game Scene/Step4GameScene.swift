//
//  Step4GameScene.swift
//  Matchamana
//
//  Created by Kevin Bryan on 20/02/24.
//

import SpriteKit
import SwiftUI

class Step4GameScene: SKScene {
    var tableNode: TableNode!

    var glassNode = SKSpriteNode()
    var milkNode = SKSpriteNode()
    var matchaNode = SKSpriteNode()

    var addedMilk = false
    var addedMatcha = false

    var selectedNode: SKSpriteNode?
    var hitZoneNode: SKShapeNode!

    var originalMatchaPosition: CGPoint!
    var originalMilkPosition: CGPoint!

    override func didMove(to view: SKView) {
        backgroundColor = .white
        tableNode = TableNode(size: CGSize(width: size.width, height: 20))
        tableNode.position = CGPoint(x: size.width / 2, y: size.height / 2 - 150)

        addChild(tableNode)

        addGlassNode()
        addMilkNode()
        addMatchaNode()

        createHitZone()
    }

    override func update(_ currentTime: TimeInterval) {}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        let touchLocation = touch.location(in: self)
        let touchedNodes = nodes(at: touchLocation)

        if let node = nodes(at: touchLocation).first as? SKSpriteNode {
            if node == glassNode {
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
            if selectedNode == milkNode && !addedMilk {
                addedMilk = true
                rotateNode(selectedNode, by: 30)
                runRotateBackAction(selectedNode)
            }
            else if selectedNode == matchaNode && !addedMatcha {
                addedMatcha = true
                rotateNode(selectedNode, by: 30)
                runRotateBackAction(selectedNode)
                matchaNode.texture = SKTexture(imageNamed: "Bowl Empty")
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let selectedNode = selectedNode {
            switch selectedNode {
            case matchaNode:
                matchaNode.position = originalMatchaPosition
            case milkNode:
                milkNode.position = originalMilkPosition
            default:
                break
            }
        }
        selectedNode = nil

        if addedMilk && addedMatcha {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                Matchamana.shared.step4Done = true
            }
        }
    }

//    MARK: UPDATES LOGIC

    func updateGlass() {
        if addedMilk && addedMatcha {
            glassNode.texture = SKTexture(imageNamed: "Glass Ice Matcha Latte \(Matchamana.shared.powder.rawValue)")
        }
        else if addedMilk {
            glassNode.texture = SKTexture(imageNamed: "Glass Ice Milk")
        }
        else if addedMatcha {
            glassNode.texture = SKTexture(imageNamed: "Glass Ice Matcha \(Matchamana.shared.powder.rawValue)")
        }
    }

//    MARK: ROTATE INGREDIENT

    func rotateNode(_ node: SKSpriteNode, by angle: CGFloat) {
        let rotateAction = SKAction.rotate(byAngle: angle * (.pi / 180), duration: 0.55)
        node.run(rotateAction)
    }

    func runRotateBackAction(_ node: SKSpriteNode) {
        let rotateBackAction = SKAction.rotate(toAngle: 0, duration: 0.5)
        node.run(SKAction.sequence([SKAction.wait(forDuration: 0.8), rotateBackAction]))

        updateGlass()
    }

//    MARK: INITIALIZATION

    func addGlassNode() {
        let bowlTexture = SKTexture(imageNamed: "Glass Ice")

        let aspectRatio = bowlTexture.size().height / bowlTexture.size().width
        let bowlWidth: CGFloat = 120
        let bowlHeight = bowlWidth * aspectRatio

        glassNode = SKSpriteNode(texture: bowlTexture, size: CGSize(width: bowlWidth, height: bowlHeight))
        glassNode.position = CGPoint(
            x: tableNode.position.x - 170,
            y: tableNode.position.y + 65)

        addChild(glassNode)
    }

    func addMatchaNode() {
        let matchaTexture = SKTexture(
            imageNamed: "Bowl Done 3 \(Matchamana.shared.powder.rawValue)")
        let aspectRatio = matchaTexture.size().height / matchaTexture.size().width
        let matchaWidth: CGFloat = 180
        let matchaHeight = matchaWidth * aspectRatio

        matchaNode = SKSpriteNode(texture: matchaTexture, size: CGSize(width: matchaWidth, height: matchaHeight))
        matchaNode.position = CGPoint(
            x: tableNode.position.x,
            y: tableNode.position.y + 40)
        matchaNode.name = "Matcha"
        originalMatchaPosition = matchaNode.position
        addChild(matchaNode)
    }

    func addMilkNode() {
        let milkTexture = SKTexture(imageNamed: "OatMilk")
        let aspectRatio = milkTexture.size().height / milkTexture.size().width
        let milkWidth: CGFloat = 130
        let milkHeight = milkWidth * aspectRatio

        milkNode = SKSpriteNode(texture: milkTexture, size: CGSize(width: milkWidth, height: milkHeight))
        milkNode.position = CGPoint(
            x: tableNode.position.x + 180,
            y: tableNode.position.y + 132)
        milkNode.name = "Milk"
        originalMilkPosition = milkNode.position
        milkNode.zPosition = 3
        addChild(milkNode)
    }

    func createHitZone() {
        let hitZoneSize = CGSize(width: 250, height: 200)
        hitZoneNode = SKShapeNode(rectOf: hitZoneSize)
        hitZoneNode.position = CGPoint(x: glassNode.position.x + 70,
                                       y: glassNode.position.y + 120)
        hitZoneNode.zPosition = -1
//        hitZoneNode.fillColor = .gray
        addChild(hitZoneNode)
    }
}
