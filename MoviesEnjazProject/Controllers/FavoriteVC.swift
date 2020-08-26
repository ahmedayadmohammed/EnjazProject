//
//  FavoriteVC.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import UIKit
import CoreData
import AudioToolbox


class FavoriteVC: UITableViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var movies:[MovieFavorite]?
    lazy var refreshController: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        refresher.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        return refresher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fecthMovies()
        self.tableView.separatorStyle = .none
        self.tableView.addSubview(refreshController)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        editButton()
    }
    
    @objc func reloadData(){
        let deadline = DispatchTime.now() + .milliseconds(800)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            AudioServicesPlayAlertSound(1519)
            self.fecthMovies()
            self.refreshController.endRefreshing()
        }
    }
    
    func editButton(){
        if self.movies!.count > 0 {
            let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditing))
            navigationItem.rightBarButtonItem = editButton
        }
    }
    
    @objc private func toggleEditing() {
        switch localize {
        case "ar" :
            tableView.setEditing(!tableView.isEditing, animated: true)
            navigationItem.rightBarButtonItem?.title = tableView.isEditing ? "تم" : "تعديل"
        default :
            tableView.setEditing(!tableView.isEditing, animated: true)
            navigationItem.rightBarButtonItem?.title = tableView.isEditing ? "Done" : "Edit"
        }
    }
    
    
    func fecthMovies(){
        do {
            self.movies = try context.fetch(MovieFavorite.fetchRequest())
            if self.movies!.count > 0 {
                self.navigationItem.title = "Favorites"
            } else {
                self.navigationItem.title = "Nothing to show"
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            print("there is some error")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favCell : FavoriteCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell") as! FavoriteCell
        let movieArray = self.movies![indexPath.row]
        favCell.movieDescription.text = movieArray.overview
        favCell.movieLanguage.text = movieArray.language
        favCell.movieName.text = movieArray.title
        favCell.movieRating.rating = movieArray.raring
        favCell.movieReleaseDate.text = movieArray.releasedate
        getImage(image: favCell.moviePhoto, cellUrl: movieArray.photo ?? "")
        return favCell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movieArray = self.movies![sourceIndexPath.item]
        movies!.remove(at: sourceIndexPath.item)
        movies!.insert(movieArray, at: destinationIndexPath.item)
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        switch localize {
        case "ar":
            let modifyAction = UIContextualAction(style: .normal, title:  "مسح", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                DispatchQueue.main.async {
                    let movieRemoving = self.movies![indexPath.row]
                    self.alertActionSheet(title: "مسح", messsage: "هل انت متأكد من حذف\(movieRemoving.title ?? "")", buttonTitle: "حذف") {
                        self.context.delete(movieRemoving)
                        do {
                            try  self.context.save()
                        } catch {
                            print("error in deleting")
                        }
                        self.fecthMovies()
                    }
                }
                success(true)
            })
            
            modifyAction.image = UIImage(systemName: "trash")
            modifyAction.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.03921568627, blue: 0.1450980392, alpha: 1)
            
            return UISwipeActionsConfiguration(actions: [modifyAction])
        default:
            let modifyAction = UIContextualAction(style: .normal, title:  "Remove", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                DispatchQueue.main.async {
                    let movieRemoving = self.movies![indexPath.row]
                    self.alertActionSheet(title: "Delete", messsage: "Are you sure to do delete \(movieRemoving.title ?? "")", buttonTitle: "Deletet") {
                        self.context.delete(movieRemoving)
                        do {
                            try  self.context.save()
                        } catch {
                            print("error in deleting")
                        }
                        self.fecthMovies()
                    }
                }
                
                success(true)
            })
            
            modifyAction.image = UIImage(systemName: "trash")
            modifyAction.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.03921568627, blue: 0.1450980392, alpha: 1)
            
            return UISwipeActionsConfiguration(actions: [modifyAction])
        }
    }
    
}
