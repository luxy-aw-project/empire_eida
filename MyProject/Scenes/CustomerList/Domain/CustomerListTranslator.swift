//
//  CustomerListTranslator.swift
//  MyProject
//
//  Created by Admiya on 2019/05/04.
//  Copyright © 2019 Admiya. All rights reserved.
//
protocol CustomerListTranslatorProtocol {
    func generateModelList(_ : [CustomerEntity]?) -> CustomerListModel
    func generateEntity(_ : CustomerListModel?) -> CustomerEntity
}

struct CustomerListTranslator: CustomerListTranslatorProtocol {
    func generateModelList(_ userEntityList : [CustomerEntity]?) -> CustomerListModel {
        var listModel = CustomerListModel()
        userEntityList?.enumerated().forEach({ (index: Int, entity: CustomerEntity) in
            // modelにカスタマー情報をセット
            var cellModel = CustomerListCellModel()
            cellModel.customerId = entity.id
            cellModel.customerName = entity.name
            cellModel.customerKana = entity.kana
            cellModel.icon = entity.icon.isEmpty ? "noimage" : entity.icon

            listModel.append(key: entity.index, value: cellModel)
        })
        return listModel
    }

    func generateEntity(_ model : CustomerListModel?) -> CustomerEntity {
        let customerEntity = CustomerEntity()
//        customerEntity.id = RealmBaseDao<UserEntity>().newStrId()
//        customerEntity.name = model?.userName ?? ""
        return customerEntity
    }
}
