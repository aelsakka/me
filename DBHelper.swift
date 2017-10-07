//
//  DBStore.swift
//  Merck Events
//
//  Created by mac on 2/26/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import CoreData

class DBHelper: NSObject {


    var managedContext:NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    func saveEntity(entityName:String,entityObject:Any) -> Bool
    {
        let entity =
            NSEntityDescription.entity(forEntityName: entityName,
                                       in: managedContext)!
        
        let savedEntity = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        
        let mirrored_object = Mirror(reflecting: entityObject)
 
        for (index, attr) in mirrored_object.children.enumerated() {
            if let property_name = attr.label as String! {
                print("Attr \(index): \(property_name) = \(attr.value)")
                if ((attr.value as? String) != nil || (attr.value as? Int) != nil)
                {
                    do
                    {
                        try savedEntity.setValue(attr.value, forKey: property_name);
                    }
                    catch let error
                    {
                        print(error);
                    }
                }
                
            
              
            }
        }
        
        if let parentClass = mirrored_object.superclassMirror
        {
            for (index, attr) in parentClass.children.enumerated() {
                if let property_name = attr.label as String! {
                    print("Attr \(index): \(property_name) = \(attr.value)")
                    if ((attr.value as? String) != nil || (attr.value as? Int) != nil)
                    {
                        do
                        {
                            try savedEntity.setValue(attr.value, forKey: property_name);
                        }
                        catch let error
                        {
                            print(error);
                        }
                    }
                    
                    
                    
                }
            }
        }
        
       do
        {
            try  self.managedContext.save()
            return true;
            
        }
        catch
        {
            return false;
        }
        
        return false;
    }
    
    
    
    
    func loadEntity(entityName:String) -> [NSManagedObject]
    {

        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: entityName)
        
        //3
        do {
            let result = try managedContext.fetch(fetchRequest)
            return result;
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
          return [];
    }
    
    func deleteEntity(entityName:String)
    {
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: entityName)
        do
        {
             let result = try? managedContext.fetch(fetchRequest)
                for object in result! {
                   managedContext.delete(object)
                }
            
        }
        catch let error
        {
            print(error);
        }
   
    }
    func loadWithPredicate(entityName:String,format:String,args:[Any]) -> [NSManagedObject]
    {
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: entityName)
        let predicate = NSPredicate(format: format, argumentArray: args);
        fetchRequest.predicate = predicate;
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            return result;
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return [];
        
    }

  
}
