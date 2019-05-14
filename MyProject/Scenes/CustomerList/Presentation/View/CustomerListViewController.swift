//
//  ViewController.swift
//  MyProject
//
//  Created by Admiya on 2019/05/04.
//  Copyright © 2019 Admiya. All rights reserved.
//
import UIKit

protocol CustomerListViewInOutput: class {
    func setViewControl(_: CustomerListModel)
}

class CustomerListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var presenter: CustomerListPresenterProtocol!
    var customerListModel: CustomerListModel = CustomerListModel()

    public func inject(presenter: CustomerListPresenterProtocol) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.load()
    }

    @IBAction func TappedAddButton(_ sender: Any) {
        let vc = CustomerConfigBuilder().build()
        self.present(vc, animated: true, completion: nil)
    }
}

// MARK: テーブルビューデータソース
extension CustomerListViewController: UITableViewDataSource {
    /// セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.customerListModel.indexList.count
    }

    /// セクションごとのデータ要素数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.customerListModel.customerList[section].count
    }

    // セクションヘッダの高さ
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    /// セクションヘッダの表示内容
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label:UILabel = UILabel()
//        label.frame =  CGRect(x: 50, y: 30, width: self.view.frame.size.width, height: 50)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
//        label.text = INDEX[section]
        label.text = self.customerListModel.indexList[section]
//        tableView.sectionHeaderHeight = 45
//        let headerView:UIView = UIView()
//        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 100)
//        headerView.backgroundColor = UIColor.gray
//        headerView.addSubview(label)

        return label
    }

    /// セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerRow", for: indexPath) as! CustomerListViewCell
        cell.updateCell(self.customerListModel.customerList[indexPath.section][indexPath.row])
        return cell
    }
}

// MARK: セルタップ時の動作定義など
extension CustomerListViewController: UITableViewDelegate {
    /// セルタップ時の挙動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // コンフィグセルの場合はカスタマーカルテへ遷移する
        if self.customerListModel.isConfigCell(indexPath) {
            let vc = CustomerKarteBuilder().build()
            self.present(vc, animated: true, completion: nil)
            return
        }

        // 前回タップされたセルではないセルがタップされた場合
        if self.customerListModel.tapIndexPath != indexPath {
            // 選択された行の下に設定行を表示する
            let insertIndexPath = self.customerListModel.insertConfigCell(indexPath)
            // 既に別のセルの設定行が表示されている場合は行を消す
            let removeIndexPath = self.customerListModel.removeConfigCell()

            // テーブルビューの表示変更を行う
            tableView.beginUpdates()
            tableView.insertRows(at: [insertIndexPath], with: .automatic)
            if (!removeIndexPath.isEmpty) {
                tableView.deleteRows(at: [removeIndexPath], with: .automatic)
            }
            tableView.endUpdates()

            // タップされたセルを保持
            self.customerListModel.tapIndexPath = indexPath

        // 前回タップされたセルと同じセルがタップされた場合
        } else {
            // 設定行を消す
            let removeIndexPath = self.customerListModel.removeConfigCell()

            // テーブルビューの表示変更を行う
            tableView.beginUpdates()
            tableView.deleteRows(at: [removeIndexPath], with: .automatic)
            tableView.endUpdates()

            // タップされたセルを削除
            self.customerListModel.tapIndexPath = []
        }
    }
}

// MARK: ボタンタップ
extension CustomerListViewController {
}

// MARK: 画面関連
extension CustomerListViewController: CustomerListViewInOutput {
    func setViewControl(_ modelList: CustomerListModel) {
        self.customerListModel = modelList
        self.tableView.reloadData()
    }

    func getViewControl() -> CustomerListCellModel {
        let model = CustomerListCellModel()
//        model.customerId = self.id.text ?? ""
        return model
    }
}
