//
//  BaceEntity.swift
//  MyProject
//
//  Created by Takeo on 2019/03/16.
//  Copyright © 2019 takeo. All rights reserved.
//

import RealmSwift

class BaceEntity: Object {
    // バージョン
    @objc dynamic var version: Int = 0
    // 削除フラグ
    @objc dynamic var deleteFlg = false
    // 登録日時
    @objc dynamic var createdAt = Date()
    // 更新日時
    @objc dynamic var updatedAt = Date()
}
