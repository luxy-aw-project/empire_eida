//
//  UserConfigPresenter.swift
//  MyProject
//
//  Created by Admiya on 2019/05/03.
//  Copyright © 2019 Admiya. All rights reserved.
//
protocol UserConfigPresenterProtocol: class {
    func load()
    func create()
}

class UserConfigPresenter: UserConfigPresenterProtocol {
    var useCase: UserConfigUseCaseProtocol
    var viewInOutput: UserConfigViewInOutput

    public required init(useCase: UserConfigUseCaseProtocol, viewInOutput: UserConfigViewInOutput) {
        self.useCase = useCase
        self.viewInOutput = viewInOutput
    }

    func load() {
        let model = self.useCase.load()
        self.setViewControl(model)
    }

    func create() {
        let model = self.getViewControl()
        self.useCase.create(model)
    }
}

// MARK: Private
extension UserConfigPresenter {
    /// 取得したデータをもとに画面出力を行う
    ///
    /// - Parameters:
    ///   - model: ユーザーコンフィグモデル
    private func setViewControl(_ model: UserConfigModel) {
        self.viewInOutput.setViewControl(model)
    }

    /// 画面入力された内容を取得する
    ///
    /// - Parameters:
    ///   - model: ユーザーコンフィグモデル
    private func getViewControl() -> UserConfigModel {
        return self.viewInOutput.getViewControl()
    }
}
