//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Bailey Search on 19/07/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import SwipeCellKit
import ChameleonFramework

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
    }
    
    // TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
        cell.delegate = self
        return cell
    }
    
    func updateNavBarColor(backgroundColor: UIColor){
        guard let navBar = navigationController?.navigationBar else {fatalError("Navigation controller does not exist")}
        
        let contrastOfBackgroundColor = ContrastColorOf(backgroundColor, returnFlat: true)
        print(contrastOfBackgroundColor)
        
        // Small navbar text
        navBar.barTintColor = backgroundColor
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastOfBackgroundColor]
        
        // Large navbar text
        let bar = UINavigationBarAppearance()
        bar.configureWithDefaultBackground()
        bar.backgroundColor = backgroundColor
        // idk why this is so much work but it finally works
        bar.titleTextAttributes = [.foregroundColor: contrastOfBackgroundColor]
        bar.largeTitleTextAttributes = [.foregroundColor: contrastOfBackgroundColor]
        
        // insures that the whole superview is taken up with the navbar and you dont get a white bar along the top on iPhone Xs and newer.
        navBar.standardAppearance = bar
        navBar.compactAppearance = bar
        navBar.scrollEdgeAppearance = bar
        
        // Change the back button and icons for both
        navBar.tintColor = contrastOfBackgroundColor
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            
            self.updateModel(at: indexPath)
            
//            if let categoryForDeletion = self.categories?[indexPath.row]{
//                do {
//                    try self.realm.write{
//                        self.realm.delete(categoryForDeletion)
//                    }
//                } catch {
//                    print(error)
//                }
//                //tableView.reloadData()
//            }
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .reveal
        return options
    }
    
    func updateModel(at indexPath: IndexPath){
        // Update data model
    }
}
