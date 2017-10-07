//
//  ProfileController.swift
//  Merck Events
//
//  Created by mac on 3/9/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileController: UIViewController {

    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblHospital: UILabel!
    @IBOutlet weak var lblSpeciality: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    var currentProfile:User!;
    override func viewDidLoad() {
        super.viewDidLoad()
        if(currentProfile.imagePath != "")
        {
            imgUser.sd_setImage(with: URL(string:currentProfile.imagePath));
  
        }
        lblName.text = currentProfile.firstName + " "+currentProfile.lastName;
        lblHospital.text = currentProfile.hospital;
        lblSpeciality.text = currentProfile.speciality;
        lblCountry.text = currentProfile.country;
    }
    override func viewWillAppear(_ animated: Bool) {
        imgUser.layer.cornerRadius = imgUser.frame.size.width/2;
        imgUser.clipsToBounds = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
