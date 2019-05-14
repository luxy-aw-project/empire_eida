//
//  CustomerConfigBuilder.swift
//  MyProject
//
//  Created by Admiya on 2019/05/05.
//  Copyright © 2019 Admiya. All rights reserved.
//
import UIKit

class CustomerConfigBuilder: BaseBuilder  {
    func build() -> UIViewController {
        guard let viewController: CustomerConfigViewController = getVcInstance() else { return getVcError() }
        //        let translator = CustomerConfigTranslator()
        //        let useCase = CustomerConfigUseCase(translator: translator)
        //        let presenter = CustomerConfigPresenter(useCase: useCase, viewInOutput: viewController)

        //        viewController.inject(presenter: presenter)

        return viewController
    }
}
