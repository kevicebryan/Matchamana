//
//  File.swift
//
//
//  Created by Kevin Bryan on 20/02/24.
//

import SpriteKit

class TableNode: SKNode {
    var table: SKSpriteNode
    var tableLegLeft: SKSpriteNode
    var tableLegRight: SKSpriteNode

    init(size: CGSize) {
        table = SKSpriteNode(color: .black, size: CGSize(width: size.width, height: 20))
        tableLegLeft = SKSpriteNode(color: .black, size: CGSize(width: 20, height: 200))
        tableLegRight = SKSpriteNode(color: .black, size: CGSize(width: 20, height: 200))

        super.init()

        setupTable()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTable() {
        addChild(table)
        addChild(tableLegLeft)
        addChild(tableLegRight)

        table.position = CGPoint(x: 0, y: 0)
        tableLegLeft.position = CGPoint(x: -table.size.width / 2 + tableLegLeft.size.width / 2, y: -table.size.height / 2 - tableLegLeft.size.height / 2)
        tableLegRight.position = CGPoint(x: table.size.width / 2 - tableLegRight.size.width / 2, y: -table.size.height / 2 - tableLegRight.size.height / 2)
    }
}
