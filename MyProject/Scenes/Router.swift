//
//  Router.swift
//  MyProject
//
//  Created by Admiya on 2019/05/06.
//  Copyright © 2019 Admiya. All rights reserved.
//
import UIKit

class Router {
    var viewController: UIViewController

    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }

    func showCustomerKatreView() {
        let vc = UserConfigBuilder().build()
        self.showView(vc)
    }

    func showCustomerListView() {
        let vc = UserConfigBuilder().build()
        self.showView(vc)
    }

    func showView(_ shoViewController: UIViewController) {
        self.viewController.present(shoViewController, animated: true, completion: nil)
    }

    func closeView() {
        self.viewController.dismiss(animated: true, completion: nil)
    }
}
