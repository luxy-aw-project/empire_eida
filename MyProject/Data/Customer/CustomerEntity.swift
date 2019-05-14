//
//  CustomerEntity.swift
//  MyProject
//
//  Created by Admiya on 2019/05/03.
//  Copyright © 2019 Admiya. All rights reserved.
//

import RealmSwift

class CustomerEntity: Object {
    // id
    @objc dynamic var id: String = ""
    // 氏名
    @objc dynamic var name: String = ""
    // かな
    @objc dynamic var kana: String = ""
    // 索引
    @objc dynamic var index: String = ""
    // 電話番号
    @objc dynamic var tel: String = ""
    // 画像
    @objc dynamic var icon: String = ""
    // バージョン
    @objc dynamic var version: Int = 1
    // 削除フラグ
    @objc dynamic var deleteFlg = false
    // 登録日時
    @objc dynamic var createdAt = Date()
    // 更新日時
    @objc dynamic var updatedAt = Date()

    // プライマリーキー
    override static func primaryKey() -> String? {
        return "id"
    }
}
