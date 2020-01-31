//
//  RoomVC.swift
//  Roomy
//
//  Created by Hady on 1/21/20.
//  Copyright © 2020 gadou. All rights reserved.
//

import UIKit

class RoomVC: UIViewController {
    var items = [Room]()

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // navigationController?.navigationBar.prefersLargeTitles = true
        title = "My Rooms"
        navigationItem.largeTitleDisplayMode = .never
     //   navigationController?.navigationBar.isHidden = true
        roomFetching()
    }
    
    func roomFetching() {
        NetworkManger.getRooms { (items, error) in
            guard let myrooms = items else {return}
                       self.items = myrooms
            print(myrooms)
                       self.tableview.reloadData()
        }
    }
}
extension RoomVC: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! RoomCell
        cell.descriptionLabel.text = items[indexPath.row].description
        cell.titleLabel.text = items[indexPath.row].title
        cell.priceLabel.text = items[indexPath.row].price
      
        
        cell.configure(imageUrl: items[indexPath.row].image ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let room = items[indexPath.row]
        navigateToDetailsVC(room: room)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
           navigationController?.hidesBarsOnTap = true
       
       }
    
    
    func navigateToDetailsVC (room: Room) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let DetailsViewController = storyBoard.instantiateViewController(identifier: "Details") as! DetailsVC
        DetailsViewController.room = room
        navigationController?.pushViewController(DetailsViewController, animated: true)
    }
      

    
}
