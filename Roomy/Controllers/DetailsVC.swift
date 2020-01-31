//
//  DetailsVC.swift
//  Roomy
//
//  Created by Hady on 1/29/20.
//  Copyright © 2020 gadou. All rights reserved.
//

import UIKit
import Kingfisher
class DetailsVC: UIViewController {

    @IBOutlet weak var dtetailsImage: UIImageView!
    @IBOutlet weak var requestBtn: UIButton!
    var room: Room!
    
    func setImage(Image:String) {
       dtetailsImage.kf.setImage(with: URL(string: Image), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        requestBtn.layer.cornerRadius = requestBtn.frame.height/2
        setImage(Image: room.image ?? "")
        
    }
    
    @objc func shareTapped(){
        
        guard let imagee = dtetailsImage.image!.jpegData(compressionQuality: 0.8) else {
           print("no image found")
            return }
        let vc = UIActivityViewController(activityItems: [imagee], applicationActivities: [])
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(vc, animated: true, completion: nil)
          
        }
    
    

}

