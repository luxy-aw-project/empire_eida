//
//  UserConfigUseCase.swift
//  MyProject
//
//  Created by Admiya on 2019/05/03.
//  Copyright © 2019 Admiya. All rights reserved.
//
protocol UserConfigUseCaseProtocol {
    func load() -> UserConfigModel
    func create(_ : UserConfigModel)
}

class UserConfigUseCase: UserConfigUseCaseProtocol {
    var translator: UserConfigTranslatorProtocol

    public required init(translator: UserConfigTranslatorProtocol) {
        self.translator = translator
    }

    func load() -> UserConfigModel {
        let entity = self.fetchUser("12345")
        let model = self.translator.generateModel(entity)
        return model
    }

    func create(_ model: UserConfigModel) {
        let entity = self.translator.generateEntity(model)
        let request = UserRequest<UserEntity>()
        request.add(entity: entity)
    }
}

// MARK: Private
extension UserConfigUseCase {
    private func fetchUser(_ userId: String) -> UserEntity? {
        let request = UserRequest<UserEntity>()
        let entity = request.find(userId: userId)
        return entity
    }
}
