//
//  UserConfigViewController.swift
//  MyProject
//
//  Created by Admiya on 2019/05/03.
//  Copyright © 2019 Admiya. All rights reserved.
//
import UIKit

protocol UserConfigViewInOutput: class {
    func setViewControl(_: UserConfigModel)
    func getViewControl() -> UserConfigModel
}

class UserConfigViewController: UIViewController {
    @IBOutlet private weak var name: UITextField!
    @IBOutlet private weak var id: UITextField!
    @IBOutlet private weak var pass: UITextField!
    @IBOutlet private var jobs: [UISwitch] = []

    private var presenter: UserConfigPresenterProtocol!
    public func inject(presenter: UserConfigPresenterProtocol) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.load()
    }
}

// MARK: ボタンタップ
extension UserConfigViewController {
    /// Actionボタンタップ
    @IBAction func TappedActionButton(_ sender: Any) {
        self.presenter.create()

        // 画面遷移
        let vc: UIViewController = CustomerListBuilder().build()
        self.present(vc, animated: true, completion: nil)
    }

    /// 戻るボタンタップ
    @IBAction func TappedBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: 画面関連
extension UserConfigViewController: UserConfigViewInOutput {
    func setViewControl(_ model: UserConfigModel) {
        self.id.text = model.userId
        self.pass.text = model.passWord
        self.name.text = model.userName
    }

    func getViewControl() -> UserConfigModel {
        let model = UserConfigModel()
        model.userId = self.id.text ?? ""
        model.passWord = self.pass.text ?? ""
        model.userName = self.name.text ?? ""
        return model
    }
}
