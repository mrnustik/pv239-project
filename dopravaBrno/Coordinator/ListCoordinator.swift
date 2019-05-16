//
//  ListCoordinator.swift
//  dopravaBrno
//
//  Created by Thành Đỗ Long on 01/05/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit

class ListCoordinator: Coordinator {
    var children: [Coordinator] = []
    weak var viewController: ListViewController?
    let transportModule: TransportModule
    let router: Router
    
    public init(router: Router, transportModule: TransportModule) {
        self.router = router
        self.transportModule = transportModule
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        viewController = ListViewController.instanceFromStoryboard()
        viewController?.tabBarItem = UITabBarItem(title: "List", image: UIImage(named: "list"), selectedImage: UIImage(named: "selectedList"))
        transportModule.multicastDelegate.addDelegate(viewController!)
    }
}
