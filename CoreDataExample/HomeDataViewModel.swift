//
//  HomeDataViewModel.swift
//  CoreDataExample
//
//  Created by Tariqul Islam on 14/5/22.
//

import UIKit
import CoreData

class HomeDataViewModel{
    
    
    func createDate(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // we need a context from this container
        let manageContext = appDelegate.persistentContainer.viewContext
        
        // now lets create an entity and new user records.
        let userEnity = NSEntityDescription.entity(forEntityName:
                                                    "UserData", in: manageContext)!
        
        for item in 1...5 {
            let user = NSManagedObject(entity: userEnity, insertInto: manageContext)
            user.setValue("Tariqul \(item)", forKey: "userName")
            user.setValue("tariqul1993@gmail.com \(item)", forKey: "email")
            user.setValue("123456 \(item)", forKey: "password")
            
        }
        print(" user saved ")

    }
    
    func retriveData(){
        print(" user retriveData ")

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let  manageContext = appDelegate.persistentContainer.viewContext
        let userEnity = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        do {
            
            let results = try manageContext.fetch(userEnity)
            for data in results as! [NSManagedObject]{
                print(data.value(forKey: "userName") as! String)
            }
            
        } catch  {
            print("fail")
        }
        
    }
    func deleteData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let  managedContext  = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        let request: NSBatchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try managedContext.execute(request)
            try managedContext.save()
        } catch  {
            print("not working")
        }
        
        
    }
    
    
    
}
