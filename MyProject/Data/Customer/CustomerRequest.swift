//
//  CustomerRequest.swift
//  MyProject
//
//  Created by Admiya on 2019/05/04.
//  Copyright © 2019 Admiya. All rights reserved.
//
import RealmSwift

class CustomerRequest<DomainType: Object> {
    let realm = try! Realm()

    func find(id: String) -> DomainType? {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        return realm.objects(DomainType.self).filter("id == %@", id).first
    }

    /// 全部取ってくる
    func findAll() -> [DomainType]? {
        print(Realm.Configuration.defaultConfiguration.fileURL!)

        // realmの戻り値ResultsからArrayの変換がうまくいかない
        let array: [DomainType] = []
//        let object = realm.objects(DomainType.self)
        return array
    }

    /// データ追加と更新
    func add(entity: DomainType) {
        let entity = entity
        try! realm.write {
            realm.add(entity, update: true)
        }
    }

    /// トランザクション
    func transaction(_ transactionBlock: () -> Void) {
        try! realm.write {
            transactionBlock()
        }
    }

    /// テストデータ追加
    func insertTest() {
        let entity = CustomerEntity()
        entity.id = "00000000000001"
        entity.name = "山本 ○賊王"
        entity.kana = "やまもと ○ふぃ"
        entity.icon = "Customer00000000000001"
        entity.index = "や"
        try! realm.write {
            realm.add(entity, update: true)
        }

        let entity2 = CustomerEntity()
        entity2.id = "00000000000002"
        entity2.name = "小山 菜○"
        entity2.kana = "こやま な○"
        entity2.icon = "Customer00000000000002"
        entity2.index = "か"
        try! realm.write {
            realm.add(entity2, update: true)
        }

        let entity3 = CustomerEntity()
        entity3.id = "00000000000003"
        entity3.name = "中津川 嘘○"
        entity3.kana = "なかつがわ うそっ○"
        entity3.icon = "Customer00000000000003"
        entity3.index = "な"
        try! realm.write {
            realm.add(entity3, update: true)
        }

        let entity4 = CustomerEntity()
        entity4.id = "00000000000004"
        entity4.name = "森下 ○枝"
        entity4.kana = "もりした ○え"
        entity4.icon = "Customer00000000000004"
        entity4.index = "ま"
        try! realm.write {
            realm.add(entity4, update: true)
        }

        let entity5 = CustomerEntity()
        entity5.id = "00000000000005"
        entity5.name = "小○塚"
        entity5.kana = "お○づか"
        entity5.icon = "Customer00000000000005"
        entity5.index = "あ"
        try! realm.write {
            realm.add(entity5, update: true)
        }

        let entity6 = CustomerEntity()
        entity6.id = "00000000000006"
        entity6.name = "佐藤 ○尋"
        entity6.kana = "さとう ○ひろ"
        entity6.icon = "Customer00000000000006"
        entity6.index = "さ"
        try! realm.write {
            realm.add(entity6, update: true)
        }

        let entity7 = CustomerEntity()
        entity7.id = "00000000000007"
        entity7.name = "吉岡 ○灯"
        entity7.kana = "よしおか ○と"
        entity7.icon = "Customer00000000000007"
        entity7.index = "や"
        try! realm.write {
            realm.add(entity7, update: true)
        }

        let entity8 = CustomerEntity()
        entity8.id = "00000000000008"
        entity8.name = "尾田 ○一郎"
        entity8.kana = "おだ ○いちろう"
        entity8.icon = "Customer00000000000008"
        entity8.index = "あ"
        try! realm.write {
            realm.add(entity8, update: true)
        }

        let entity9 = CustomerEntity()
        entity9.id = "00000000000009"
        entity9.name = "高畑 ディ○ア"
        entity9.kana = "たかはた でぃ○あ"
        entity9.icon = "Customer00000000000009"
        entity9.index = "た"
        try! realm.write {
            realm.add(entity9, update: true)
        }

        let entity10 = CustomerEntity()
        entity10.id = "00000000000010"
        entity10.name = "校長"
        entity10.kana = "こうちょう"
        entity10.icon = "Customer00000000000010"
        entity10.index = "か"
        try! realm.write {
            realm.add(entity10, update: true)
        }

        let entity11 = CustomerEntity()
        entity11.id = "00000000000011"
        entity11.name = "ブ○ック"
        entity11.kana = "ぶ○っく"
        entity11.icon = "Customer00000000000011"
        entity11.index = "は"
        try! realm.write {
            realm.add(entity11, update: true)
        }
    }

    /// 全部取ってくる
    func findAllStab() -> [CustomerEntity]? {
        var array: [CustomerEntity] = []
        
        let entity8 = CustomerEntity()
        entity8.id = "00000000000008"
        entity8.name = "尾田 ○一郎"
        entity8.kana = "おだ ○いちろう"
        entity8.icon = "Customer00000000000008"
        entity8.index = "あ"
        array.append(entity8)
        
        let entity5 = CustomerEntity()
        entity5.id = "00000000000005"
        entity5.name = "小○塚"
        entity5.kana = "お○づか"
        entity5.icon = "Customer00000000000005"
        entity5.index = "あ"
        array.append(entity5)

        let entity10 = CustomerEntity()
        entity10.id = "00000000000010"
        entity10.name = "校長"
        entity10.kana = "こうちょう"
        entity10.icon = "Customer00000000000010"
        entity10.index = "か"
        array.append(entity10)

        let entity2 = CustomerEntity()
        entity2.id = "00000000000002"
        entity2.name = "小山 菜○"
        entity2.kana = "こやま な○"
        entity2.icon = "Customer00000000000002"
        entity2.index = "か"
        array.append(entity2)
        
        let entity6 = CustomerEntity()
        entity6.id = "00000000000006"
        entity6.name = "佐藤 ○尋"
        entity6.kana = "さとう ○ひろ"
        entity6.icon = "Customer00000000000006"
        entity6.index = "さ"
        array.append(entity6)

        let entity9 = CustomerEntity()
        entity9.id = "00000000000009"
        entity9.name = "高畑 ディ○ア"
        entity9.kana = "たかはた でぃ○あ"
        entity9.icon = "Customer00000000000009"
        entity9.index = "た"
        array.append(entity9)

        let entity3 = CustomerEntity()
        entity3.id = "00000000000003"
        entity3.name = "中津川 嘘○"
        entity3.kana = "なかつがわ うそっ○"
        entity3.icon = "Customer00000000000003"
        entity3.index = "な"
        array.append(entity3)

        let entity11 = CustomerEntity()
        entity11.id = "00000000000011"
        entity11.name = "ブ○ック"
        entity11.kana = "ぶ○っく"
        entity11.icon = "Customer00000000000011"
        entity11.index = "は"
        array.append(entity11)

        let entity4 = CustomerEntity()
        entity4.id = "00000000000004"
        entity4.name = "森下 ○枝"
        entity4.kana = "もりした ○え"
        entity4.icon = "Customer00000000000004"
        entity4.index = "ま"
        array.append(entity4)

        let entity = CustomerEntity()
        entity.id = "00000000000001"
        entity.name = "山本 ○賊王"
        entity.kana = "やまもと ○ふぃ"
        entity.icon = "Customer00000000000001"
        entity.index = "や"
        array.append(entity)

        let entity7 = CustomerEntity()
        entity7.id = "00000000000007"
        entity7.name = "吉岡 ○灯"
        entity7.kana = "よしおか ○と"
        entity7.icon = "Customer00000000000007"
        entity7.index = "や"
        array.append(entity7)

        return array
    }
}
