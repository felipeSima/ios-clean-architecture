//
//  RealmManager.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation
import RealmSwift
import Realm

class RealmManager {
    
    public static let shared = RealmManager()
    
    public lazy var realm:Realm? = {
        do {
            return try Realm()
        }
        catch {
            print("Error info: \(error)")
            return nil
        }
    }()
    
    public func Configure(){
        let config = Realm.Configuration(schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in
             if (oldSchemaVersion < 1) {
                print("Migration OldSchemaVersion")
             }
        })
        Realm.Configuration.defaultConfiguration = config
    }
    
    public func updateValue(object:Object?, key:String, value:Any?){
        writeBlock {
            object?.setValue(value, forKey: key)
        }
    }
    
    public func writeBlock(block:() -> Void){
        do {
            try realm?.write {
                block()
            }
        }catch {
            
        }
    }
    
    public func fetchObjects<T: Object>(ofType type:T.Type, query:String? = nil) -> Array<T> {
        print("[Realm] - Fetching data")
        if var objects = realm?.objects(type.self){
            if let query = query {
                objects = objects.filter(query)
            }
            return Array(objects)
        }
        return Array<T>()
    }
    
    public func fetchObjectsResult<T: Object>(ofType type:T.Type, query:String? = nil) -> Results<T>? {
        print("[Realm] - Fetching data")
        var objects = realm?.objects(type.self)
        if let query = query {
            objects = objects?.filter(query)
        }
        return objects
    }
    
    public func fetchObject<T: Object>(ofType type:T.Type) -> T? {
           print("[Realm] - Fetching single object")
           return realm?.objects(type.self).first
       }
    
    public func fetchObject<T: Object>(ofType type:T.Type, query:String) -> T? {
        print("[Realm] - Fetching single object")
        return realm?.objects(type.self).filter(query).first
    }
    
    public func save(object:Object, update: Realm.UpdatePolicy = .error){
        print("[Realm] - Saving data")
        do {
            try realm?.write {
                realm?.add(object, update: update)
                print("[Realm] - Object saved")
            }
        }
        catch{
            print("[Realm] - SAVING OBJECT FAILED")
        }
    }
    
    public func delete(object:Object){
        print("[Realm] - Deleting object")
        writeBlock {
            realm?.delete(object)
        }
    }
    
    public func delete<T: Object>(ofType type: T.Type, query:String? = nil){
        if let query = query {
            if let object = realm?.objects(type.self).filter(query).first {
                print("[Realm] - Deleting object")
                do {
                    try realm?.write({
                        realm?.delete(object)
                    })
                }
                catch {
                    print("[Realm] - DELETING OBJECT FAILED")
                }
            }
        }
        else{
            if let object = realm?.objects(type.self).first {
                writeBlock {
                    realm?.delete(object)
                }
            }
        }
        
    }
    
    
}
