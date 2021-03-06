//
//  SettingTableViewController.swift
//  Cykas
//
//  Created by ANTONIO ALBERINI on 06/04/2017.
//  Copyright © 2017 ALBA. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    var labels = [String]()
    var imgs = [UIImage]()
    var items = [Notes]()
    var images = [Media]()
    let msg = NSLocalizedString("Change Gesture", comment: "Change Gesture")
    let msg1 = NSLocalizedString("Delete All", comment: "Delete All")
    let msg2 = NSLocalizedString("Cancel ", comment: "Cancel ")
    let msg3 = NSLocalizedString("Yes ", comment: "Yes ")
    let msg4 = NSLocalizedString("Files delete with successfull", comment: "Files delete with successfull")
    let msg5 = NSLocalizedString("Success", comment: "Success")
    
    let msg6 = NSLocalizedString("Elimina Files", comment: "Elimina Files")
    
    let msg7 = NSLocalizedString("Vuoi eliminare tutti i files ?", comment: "Vuoi eliminare tutti i files ?")
    
    
    

    



    
    override func viewDidLoad() {
        super.viewDidLoad()
        labels.append(msg)
        labels.append(msg1)
        imgs.append(#imageLiteral(resourceName: "t1"))
        imgs.append(#imageLiteral(resourceName: "tresh"))
        items =  NotePersistenceManager.fetchData()
        images = MediaPersistenceManager.fetchData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellItemSetting", for: indexPath) as! SettingItemCell
        cell.label.text = labels[indexPath.row]
        cell.img.image = imgs[indexPath.row]
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "inserisciGesture"{
            let currentrow = tableView.indexPathForSelectedRow?.row
            let img = imgs[currentrow!]
            if(img == imgs[1]){
                let addActionSheet = UIAlertController.init(
                    title: msg6,
                    message: msg7,
                    preferredStyle: UIAlertControllerStyle.init(rawValue: 1)!)
                
                
                addActionSheet.addAction(UIAlertAction.init(title: msg2, style: .cancel, handler: nil))
                
                
                addActionSheet.addAction(UIAlertAction.init(title: msg3,style: .default,
                                                            handler: {(action: UIAlertAction) in self.DeleteAllFiles()}))
                
                
                
                self.present(addActionSheet, animated: true, completion: nil)
            }
            else if(img == imgs[0]){
                let nextdestination = segue.destination as! TutorialViewController
                nextdestination.flag=true
                
            }
        }
    }
    
        func DeleteAllFiles(){
            NotePersistenceManager.deleteAllItem()
            MediaPersistenceManager.deleteAllItem()
            self.alert(message: msg4 , title:msg5 )
        }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
