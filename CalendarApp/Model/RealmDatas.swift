//
//  RealmDatas.swift
//  CalendarApp
//
//  Created by 中野翔太 on 2021/12/06.
//

import Foundation
import RealmSwift

class RealmDatas:Object{

    @objc dynamic var day = String()
    @objc dynamic var title = String()
    @objc dynamic var memo = String()

}

