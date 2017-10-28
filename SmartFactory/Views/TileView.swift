//
//  Tile.swift
//  SmartFactory
//
//  Created by Sophie on 28.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import Foundation
import UIKit

protocol TileViewDelegate {
    func showPopover(sender: TileView)
}

class TileView: UIButton {
    static let tileSize: CGFloat = 60
    var delegate: TileViewDelegate?
    
    var tile: Tile { didSet {
        setNeedsDisplay()
        setImage()
        }
    }
    
    init(tile: Tile) {
        self.tile = tile
        super.init(frame: .zero)
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: TileView.tileSize),
            self.heightAnchor.constraint(equalToConstant: TileView.tileSize)
            ])
        setBackgroundImage(#imageLiteral(resourceName: "tile"), for: .normal)
        
        addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    required init(coder: NSCoder) { fatalError() }

    @objc func pressed() {
        if tile.status == .item {
            showPopup()
        }
    }
    
    private func showPopup() {
        self.delegate?.showPopover(sender: self)
    }
    
    func setImageFor(machine: Machine) {
        setBackgroundImage(machine.imageForType(), for: .normal)
    }
    
    func setImageFor(pathComponent: PathComponent) {
        setBackgroundImage(pathComponent.imageForState(), for: .normal)
    }
    
    private func setImage() {
        switch tile.status {
        case .empty: setBackgroundImage(#imageLiteral(resourceName: "tile"), for: .normal)
        case .item: setBackgroundImage(#imageLiteral(resourceName: "item"), for: .normal)
        case .machineTop: setBackgroundImage(#imageLiteral(resourceName: "bohrmaschine_unselected"), for: .normal)
        case .machineBottom: setBackgroundImage(#imageLiteral(resourceName: "unselected"), for: .normal)
        default: setBackgroundImage(#imageLiteral(resourceName: "tile"), for: .normal)
        }
    }
}
