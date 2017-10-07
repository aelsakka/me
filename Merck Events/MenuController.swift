//
//  MenuController.swift
//  Merck Events
//
//  Created by mac on 2/28/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import SDWebImage

class MenuController: UIViewController {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print(DataSingleton.sharedInstance.currentUser.imagePath);
        userImage.sd_setImage(with: URL(string: DataSingleton.sharedInstance.currentUser.imagePath), completed:{
            (image, error, imageCacheType, imageUrl) in
            self.userImage.layer.cornerRadius = self.userImage.frame.size.width/2
            self.userImage.clipsToBounds = true;
            self.lblUserName.text = DataSingleton.sharedInstance.currentUser.firstName;
        });
       

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
