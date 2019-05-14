//
//  CustomerListUseCase.swift
//  MyProject
//
//  Created by Admiya on 2019/05/04.
//  Copyright © 2019 Admiya. All rights reserved.
//
protocol CustomerListUseCaseProtocol {
    func load() -> CustomerListModel
    func create(_ : CustomerListCellModel)
}

class CustomerListUseCase: CustomerListUseCaseProtocol {
    var translator: CustomerListTranslatorProtocol

    public init(translator: CustomerListTranslatorProtocol) {
        self.translator = translator
    }

    func load() -> CustomerListModel {
        let entity = self.fetchAllCustomer()
        let model = self.translator.generateModelList(entity)
        return model
    }

    func create(_ model: CustomerListCellModel) {
//        let entity = self.translator.generateEntity(model)
//        let request = UserRequest<UserEntity>()
//        request.add(entity: entity)
    }
}

// MARK: Private
extension CustomerListUseCase {
    private func fetchAllCustomer() -> [CustomerEntity]? {
        let request = CustomerRequest<CustomerEntity>()
        return request.findAllStab()
    }
}
