//
//  CustomerListPresenter.swift
//  MyProject
//
//  Created by Admiya on 2019/05/04.
//  Copyright © 2019 Admiya. All rights reserved.
//
protocol CustomerListPresenterProtocol: class {
    func load()
    func create(_ : CustomerListCellModel)
}

class CustomerListPresenter: CustomerListPresenterProtocol {
    var useCase: CustomerListUseCaseProtocol
    var viewInOutput: CustomerListViewInOutput

    public required init(useCase: CustomerListUseCaseProtocol, viewInOutput: CustomerListViewInOutput) {
        self.useCase = useCase
        self.viewInOutput = viewInOutput
    }

    func load() {
        let modelList = self.useCase.load()
        self.setViewControl(modelList)
    }

    func create(_ model: CustomerListCellModel) {
        self.useCase.create(model)
    }
}

// MARK: Private
extension CustomerListPresenter {
    /// ViewControllerに画面出力の依頼を行う
    ///
    /// - Parameters:
    ///   - model: カスタマーリストモデル
    private func setViewControl(_ modelList: CustomerListModel) {
        self.viewInOutput.setViewControl(modelList)
    }
}
