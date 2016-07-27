//
//  Task.swift
//  taskapp
//
//  Created by kohsuke.takeda on 2016/07/18.
//  Copyright © 2016年 kosuke.takeda. All rights reserved.
//



import RealmSwift

class Task: Object{
    //管理用ID プレイマリーキー
    dynamic var id = 0
    
    //タイトル
    dynamic var title = ""
    
    //内容
    dynamic var contents = ""
    
    //日時
    dynamic var date = NSDate()
    
    //category を追加する
    dynamic var category = ""

    
    //idをプライマリーキーとして設定
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
    
    
}

