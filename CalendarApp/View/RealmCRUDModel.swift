//
//  RealmCRUDModel.swift
//  CalendarApp
//
//  Created by 中野翔太 on 2021/12/06.
//

import Foundation
import RealmSwift


class RealmCRUDModel{

    var readRealmArray:[[String:String]] = []

}

extension RealmCRUDModel{

    func createRealm(createDay:String,createTitle:String,createMemo:String){
        do{
            let realm = try! Realm()
            let realmDatas = RealmDatas()
            realmDatas.day = createDay
            realmDatas.title = createTitle
            realmDatas.memo = createMemo
            try! realm.write({
                realm.add(realmDatas)
            })
        }catch{
            print("エラーです")
        }
    }
   
}
extension RealmCRUDModel{
    func readRealm(){
        do{
                   let realm = try! Realm()
                   self.readRealmArray = []

                   for readResult in realm.objects(RealmDatas.self){

                       self.readRealmArray.append(["RealmTitle":readResult.title,"RealmMemo":readResult.memo])

                   }

               }catch{
                   print(error.localizedDescription)
               }
           }
    }

extension RealmCRUDModel{

    func filterReadRealm(calendarDay:String){

        do{
            let realm = try! Realm()
            self.readRealmArray = []

            for filterReadResult in realm.objects(RealmDatas.self).filter(NSPredicate(format: "day == %@", calendarDay)){

                self.readRealmArray.append(["RealmTitle":filterReadResult.title,"RealmMemo":filterReadResult.memo])

            }
        }catch{

            print(error.localizedDescription)

        }
    }
}
