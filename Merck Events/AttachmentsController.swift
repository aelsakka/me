//
//  AttachmentsController.swift
//  Merck Events
//
//  Created by mac on 3/8/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class AttachmentsController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSingleton.sharedInstance.currentEvent.getAttachments().count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let attachmentCell = tableView.dequeueReusableCell(withIdentifier: "attachmentCell") as! AttachmentCell;
        let tempAttachment = DataSingleton.sharedInstance.currentEvent.getAttachments()[indexPath.row];
        attachmentCell.lblFile.text = tempAttachment.fileName;
        
        if(tempAttachment.fileType == "pdf")
        {
            attachmentCell.imgFile.image = UIImage(named: "pdf-icon");
        }
        else if(tempAttachment.fileType == "docx")
        {
            attachmentCell.imgFile.image = UIImage(named: "word-icon");
        }
        return attachmentCell;
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TransitionsHelper().getViewController(name: "displayAttachmentView") as! DisplayAttachmentController;
        vc.attachmentUrl = DataSingleton.sharedInstance.currentEvent.getAttachments()[indexPath.row].filePath;
        self.navigationController?.pushViewController(vc, animated: true);
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
