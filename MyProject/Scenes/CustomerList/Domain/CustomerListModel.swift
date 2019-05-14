//
//  CustomerListModel.swift
//  MyProject
//
//  Created by Admiya on 2019/05/04.
//  Copyright © 2019 Admiya. All rights reserved.
//
import Foundation

struct CustomerListCellModel {
    var customerId: String = ""
    var customerName: String = ""
    var customerKana: String = ""
    var icon: String = ""
    var treatmentDate: String = ""
    var configCell = false
}

struct CustomerListModel {
    var indexList: [String] = []
    var customerList: [[CustomerListCellModel]] = []
    var tapIndexPath:IndexPath = []

    /// カスタマー情報の追加
    ///
    /// - Parameters:
    ///   - key: 索引値
    ///   - value: 追加するカスタマー情報
    mutating func append(key: String, value: CustomerListCellModel) {
        if let index = indexList.firstIndex(of: key) {
            self.customerList[index].append(value)
        } else {
            indexList.append(key)
            customerList.append([])
            customerList[indexList.count - 1].append(value)
        }
    }

    /// 設定セルの判断
    ///
    /// - Parameters:
    ///   - tapIndexPath: タップされたセル
    /// - Returns: 設定セルの有無
    mutating func isConfigCell(_ tapIndexPath: IndexPath) -> Bool {
        return customerList[tapIndexPath.section][tapIndexPath.row].configCell
    }

    /// configCellの追加
    ///
    /// - Parameters:
    ///   - indexPath: タップされたセル
    /// - Returns: 追加したセルのインデックスパス
    mutating func insertConfigCell(_ indexPath: IndexPath) -> IndexPath {
        // 設定セルをTrueで追加するモデルを作成
        var model = CustomerListCellModel()
        model.configCell = true

        // 選択された行の下に設定行を表示する
        let insertRow = indexPath.row + 1
        customerList[indexPath.section].insert(model, at: insertRow)

        return IndexPath(row: insertRow, section: indexPath.section)
    }

    /// configCellの削除
    ///
    /// - Returns: 追加したセルのインデックスパス
    mutating func removeConfigCell() -> IndexPath {
        // 既存の設定セルが存在しない場合は処理終了
        if (self.tapIndexPath.isEmpty) { return [] }

        // 既存の設定セルを削除する
        let removeRow = self.tapIndexPath.row + 1
        customerList[tapIndexPath.section].remove(at: removeRow)

        return IndexPath(row: removeRow, section: self.tapIndexPath.section)
    }
}
