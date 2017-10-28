//
//  StatusView.swift
//  SmartFactory
//
//  Created by Sophie on 28.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import UIKit

enum CapacityStatus: Int {
    case low, medium, high
}

class StatusView: UIView {
    let spacing: CGFloat = 5
    var status: CapacityStatus
    
    init(status: CapacityStatus) {
        self.status = status
        super.init(frame: .zero)
        setup()
    }
    
    required init(coder: NSCoder) { fatalError() }

    func setup() {
        var colorViews = [UIView]()
        for _ in 0..<3 {
            let colorView = UIView(frame: .zero)
            colorView.backgroundColor = .clear
            colorView.translatesAutoresizingMaskIntoConstraints = false
            colorViews.append(colorView)
        }
        
        for i in 0..<status.rawValue {
            var color = UIColor.green
            if status.rawValue == 1 {
                color = .yellow
            } else if status.rawValue == 2 {
                color = .red
            }
            colorViews[i].backgroundColor = color
        }
        
        let stackView = UIStackView(arrangedSubviews: colorViews)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = spacing
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = true
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacing),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: spacing),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: spacing),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
            ])
    }
}
