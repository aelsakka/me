//
//  EventController.swift
//  Merck Events
//
//  Created by mac on 3/1/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit


class EventController: UIViewController{

    @IBAction func onAgendaClicked(_ sender: Any) {
        let vc = TransitionsHelper().getViewController(name: "agendaView");
        self.navigationController?.pushViewController(vc, animated: true);
    }

    @IBAction func onGalleryClicked(_ sender: Any) {
        let vc = TransitionsHelper().getViewController(name: "galleryView");
        self.navigationController?.pushViewController(vc, animated: true);
    }
    @IBAction func onAnnouncementClicked(_ sender: Any) {
        let vc = TransitionsHelper().getViewController(name: "chatView") as! ChatController;
        vc.currentChatType = 1;
        self.navigationController?.pushViewController(vc, animated: true);
    }
    @IBAction func onSurveysClicked(_ sender: Any) {
        let vc = TransitionsHelper().getViewController(name: "surveysView");
        self.navigationController?.pushViewController(vc, animated: true);
    }
    @IBOutlet weak var imgEvent: UIImageView!

    @IBAction func onAttachmentsClicked(_ sender: Any) {
        let vc = TransitionsHelper().getViewController(name: "attachmentsView");
        self.navigationController?.pushViewController(vc, animated: true);
    }
    @IBAction func onChatClicked(_ sender: Any) {
        let vc = TransitionsHelper().getViewController(name: "chatView") as! ChatController;
        vc.currentChatType = 0;
        self.navigationController?.pushViewController(vc, animated: true);
    }
    @IBOutlet weak var lblEventLocation: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblEventTitle: UILabel!
    @IBOutlet weak var lblEventDate: UILabel!
    @IBOutlet weak var viewLocation: UIView!
    @IBOutlet weak var viewDate: UIView!
    @IBOutlet weak var tvEventDetails: UITextView!
    @IBAction func onAttendeesClicked(_ sender: Any) {
        let vc = TransitionsHelper().getViewController(name: "attendeesView");
        self.navigationController?.pushViewController(vc, animated: true);
    }
    @IBAction func onSpeakersClicked(_ sender: Any) {
        let vc = TransitionsHelper().getViewController(name: "speakersView");
        self.navigationController?.pushViewController(vc, animated: true);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgEvent.sd_setImage(with: URL(string: DataSingleton.sharedInstance.currentEvent.halfImage), completed: nil);
        lblEventTitle.text = DataSingleton.sharedInstance.currentEvent.title;
        lblEventLocation.text = DataSingleton.sharedInstance.currentEvent.location;
        lblEventDate.text = DataSingleton.sharedInstance.currentEvent.date;
        
        viewDate.layer.cornerRadius = 30;
        viewLocation.layer.cornerRadius = 30;
        
        tvEventDetails.text = DataSingleton.sharedInstance.currentEvent.details;
        
        
        
        
        
        // Do any additional setup after loading the view.
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
