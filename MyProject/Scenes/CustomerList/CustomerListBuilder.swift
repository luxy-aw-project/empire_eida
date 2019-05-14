//
//  CustomerListBuilder.swift
//  MyProject
//
//  Created by Admiya on 2019/05/03.
//  Copyright © 2019 Admiya. All rights reserved.
//
import UIKit

class CustomerListBuilder: BaseBuilder  {
    func build() -> UIViewController {
        guard let viewController: CustomerListViewController = getVcInstance() else { return getVcError() }
        let translator = CustomerListTranslator()
        let useCase = CustomerListUseCase(translator: translator)
        let presenter = CustomerListPresenter(useCase: useCase, viewInOutput: viewController)

        viewController.inject(presenter: presenter)

        return viewController
    }
}
