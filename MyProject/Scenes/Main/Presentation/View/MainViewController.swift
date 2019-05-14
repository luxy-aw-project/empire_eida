//
//  MainViewController.swift
//  MyProject
//
//  Created by Admiya on 2019/05/03.
//  Copyright © 2019 Admiya. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func TappedLoginButton(_ sender: Any) {
        let vc = CustomerListBuilder().build()
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func TappedEntryButton(_ sender: Any) {
//        guard let vc: UserConfigViewController = getVcInstance() else { return }
        let vc = UserConfigBuilder().build()
        self.present(vc, animated: true, completion: nil)
    }

    func getVcInstance<T: UIViewController>() -> T? {
        // ViewControllerの型名を取得
        let name = String(describing: T.self).replacingOccurrences(of: "ViewController", with: "")
        // ViewControllerの型の格納したBundleを取得
        let bundle = Bundle(for: T.self)
        // Storyboardを取得し、TとしてViewControllerをインスタンス化
        let storyboard = UIStoryboard(name: name, bundle: bundle)

        return storyboard.instantiateInitialViewController() as? T
    }
}
