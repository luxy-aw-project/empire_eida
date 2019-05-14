//
//  BaseBuilder.swift
//  MyProject
//
//  Created by Admiya on 2019/05/03.
//  Copyright © 2019 Admiya. All rights reserved.
//
import UIKit

class BaseBuilder {
    /// ビューコントローラーインスタンスの取得
    ///
    /// - Parameters:
    ///   - T: ビューコントローラー
    /// - Returns: ビューコントローラー
    func getVcInstance<T: UIViewController>() -> T? {
        // ViewControllerの型名を取得
        let name = String(describing: T.self).replacingOccurrences(of: "ViewController", with: "")
        // ViewControllerの型の格納したBundleを取得
        let bundle = Bundle(for: T.self)
        // Storyboardを取得し、TとしてViewControllerをインスタンス化
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        
        return storyboard.instantiateInitialViewController() as? T
    }

    /// エラービューコントローラーインスタンスの取得
    ///
    /// - Returns: エラービューコントローラー
    func getVcError() -> UIViewController {
        return UserConfigViewController()
    }
}
