//
//  UserConfigBuilder.swift
//  MyProject
//
//  Created by Admiya on 2019/05/03.
//  Copyright © 2019 Admiya. All rights reserved.
//
import UIKit

class UserConfigBuilder: BaseBuilder  {
    func build() -> UIViewController {
        guard let viewController: UserConfigViewController = getVcInstance() else { return getVcError() }
        let translator = UserConfigTranslator()
        let useCase = UserConfigUseCase(translator: translator)
        let presenter = UserConfigPresenter(useCase: useCase, viewInOutput: viewController)

        viewController.inject(presenter: presenter)

        return viewController
    }
}
