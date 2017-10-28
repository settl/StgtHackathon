//
//  FloorViewController.swift
//  SmartFactory
//
//  Created by Sophie on 27.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import UIKit

class FloorViewController: UIViewController {
    var capacityView = UIView()
    var stackView = UIStackView()
    var tileViews = [TileView]()
    var floor = Floor()
    var machines = [Machine]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Naked Factory"
        tabBarItem.title = "Tracking"
        
        setupTileViews()
        setupStackView()
        setupCapacityView()
        fetchFloorInformation()
    }
    
    func fetchFloorInformation() {
        FloorFetcher().fetchMachineInfo { machines in
            self.machines = machines
            DispatchQueue.main.async {
                self.add(machines: machines)
                self.tileViews[37].tile.status = .item
            }
        }
        
        FloorFetcher().fetchPathInfo { path in
            DispatchQueue.main.async {
                self.add(path: path)
            }
        }
    }
    
    func add(path: [PathComponent]) {
        for component in path {
            let index = Int(component.position_y)! * Floor.floorWidth + Int(component.position_x)!
            self.tileViews[index].setImageFor(pathComponent: component)
        }
    }
    
    private func add(machines: [Machine]) {
        for machine in machines {
            add(machine: machine)
        }
    }
    
    private func add(machine: Machine) {
        let index = Int(machine.position_y)! * Floor.floorWidth + Int(machine.position_x)!
        self.tileViews[index].setImageFor(machine: machine)
        if index + Floor.floorWidth < floor.tiles.count {
            self.tileViews[index + Floor.floorWidth].tile.status = .machineBottom
        }
    }
    
    private func setupTileViews() {
        for tile in floor.tiles {
            let tileView = TileView(tile: tile)
            tileView.delegate = self
            tileViews.append(tileView)
        }
    }
    
    private func setupStackView() {
        var subViews = [UIStackView]()
        for row in 0..<Floor.floorHeight {
            let startIndex = row * Floor.floorWidth
            let colstackView = UIStackView(arrangedSubviews: Array(tileViews[startIndex...startIndex + Floor.floorWidth - 1]) )
            colstackView.axis = .horizontal
            colstackView.distribution = .equalSpacing
            colstackView.spacing = 5
            colstackView.translatesAutoresizingMaskIntoConstraints = false
            subViews.append(colstackView)
        }
        
        stackView = UIStackView(arrangedSubviews: subViews)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    
    private func setupCapacityView() {
        capacityView.backgroundColor = .darkBlue
        view.addSubview(capacityView)
        capacityView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            capacityView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            capacityView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            capacityView.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -40),
            capacityView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
            ])
        
        let statusView = StatusView(status: .low)
        statusView.translatesAutoresizingMaskIntoConstraints = false
        capacityView.addSubview(statusView)
        
//        NSLayoutConstraint.activate([
//            statusView.topAnchor.constraint(equalTo: capacityView.topAnchor, constant: 20),
//            statusView.leadingAnchor.constraint(equalTo: capacityView)
//            ])
        
//        let statusArray: [CapacityStatus] = [.low, .medium, .high]
//        for status in statusArray {
//            let statusView = StatusView(status: status)
//            statusView.translatesAutoresizingMaskIntoConstraints = false
//            capacityView.addSubview(statusView)
//        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension FloorViewController: TileViewDelegate {
    func showPopover(sender: TileView) {
        let vc = ItemDetailViewController()
        vc.preferredContentSize = CGSize.init(width: 400, height: 200)
        
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .popover
        let popvc = navigationController.popoverPresentationController
        popvc?.delegate = self
        popvc?.permittedArrowDirections = .any
        popvc?.sourceView = sender
        popvc?.sourceRect = CGRect(x: 0 , y: sender.frame.origin.y, width: sender.frame.size.width, height: sender.frame.size.height)
        
        present(navigationController, animated: true, completion: nil)
    }
}

extension FloorViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
}


