//
//  CustomerKarteBuilder.swift
//  MyProject
//
//  Created by Admiya on 2019/05/05.
//  Copyright © 2019 Admiya. All rights reserved.
//
import UIKit

class CustomerKarteBuilder: BaseBuilder  {
    func build() -> UIViewController {
        guard let viewController: CustomerKarteViewController = getVcInstance() else { return getVcError() }
//        let translator = CustomerKarteTranslator()
//        let useCase = CustomerKarteUseCase(translator: translator)
//        let presenter = CustomerKartePresenter(useCase: useCase, viewInOutput: viewController)
        
//        viewController.inject(presenter: presenter)

        return viewController
    }
}
