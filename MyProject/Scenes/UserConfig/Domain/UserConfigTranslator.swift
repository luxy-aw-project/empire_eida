//
//  UserConfigTranslator.swift
//  MyProject
//
//  Created by Admiya on 2019/05/03.
//  Copyright © 2019 Admiya. All rights reserved.
//
protocol UserConfigTranslatorProtocol {
    func generateModel(_ : UserEntity?) -> UserConfigModel
    func generateEntity(_ : UserConfigModel?) -> UserEntity
}

class UserConfigTranslator: UserConfigTranslatorProtocol {
    func generateModel(_ userEntity : UserEntity?) -> UserConfigModel {
        let model = UserConfigModel()
        model.userId = userEntity?.id ?? ""
        model.passWord = userEntity?.password ?? ""
        model.userName = userEntity?.name ?? ""
        return model
    }

    func generateEntity(_ model : UserConfigModel?) -> UserEntity {
        let userEntity = UserEntity()
        userEntity.id = RealmBaseDao<UserEntity>().newStrId()
        userEntity.password = model?.passWord ?? ""
        userEntity.name = model?.userName ?? ""
        return userEntity
    }
}
