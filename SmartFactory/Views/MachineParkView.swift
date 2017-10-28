//
//  MachineParkView.swift
//  SmartFactory
//
//  Created by Sophie on 28.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import UIKit

class MachineParkView: UIView {
    let imageView = UIImageView()
    
    convenience init(machinePark: Machine) {
        self.init(frame: .zero)
        setupConstraints()
        configure(park: machinePark)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(park: Machine) {
        imageView.image = mapTypeToImage(type: park.typ)
    }
    
    func mapTypeToImage(type: String) -> UIImage {
        return #imageLiteral(resourceName: "machine")
    }
    
    func setupConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
