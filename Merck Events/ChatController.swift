//
//  ChatController.swift
//  Merck Events
//
//  Created by mac on 3/14/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import PullToRefreshSwift
import SDWebImage
import JHSpinner

class ChatController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBAction func onSendClicked(_ sender: Any) {
        var newChat=Chat();
        newChat.content = tvNewChat.text;
        newChat.eventId = DataSingleton.sharedInstance.currentEvent.id;
        newChat.senderId = DataSingleton.sharedInstance.currentUser.id;
        newChat.senderImage = DataSingleton.sharedInstance.currentUser.imagePath;
        newChat.senderName = DataSingleton.sharedInstance.currentUser.firstName;
        
        if(currentChatType == 0)
        {
            newChat.type = "Chat";
        }
        else
        {
            newChat.type = "Announcement";
        }
        
        self.conversations.append(newChat);
         self.tblChat.tableViewScrollToBottom(animated: true);
        tvNewChat.text = "";
        self.tblChat.reloadData();
        ChatStore().sendChat(chatObj: newChat, callback: {
        status in
        })
    }
    @IBOutlet weak var tvNewChat: UITextView!
    @IBOutlet weak var sendView: UIView!
    @IBOutlet weak var tblChat: UITableView!
    var conversations=[Chat]();
    var totalConversations=[Any]();
    var currentIndex:Int=0;
    var currentChatType:Int=0;
    @IBOutlet weak var tblMarginBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblChat.addPullRefresh(refreshCompletion: {
        [weak self] in
            if((self?.currentIndex)!-1 >= 0)
            {
                self?.currentIndex -= 1;
                 //self?.conversations = self?.totalConversations[(self?.currentIndex)!] as! [Chat];
                let tempArray = self?.totalConversations[(self?.currentIndex)!] as! [Chat];
                //  self?.conversations.append(contentsOf: tempArray);
                self?.conversations.insert(contentsOf: tempArray, at: 0);
            }
            self?.tblChat.reloadData();
            self?.tblChat.stopPullRefreshEver();
        })
         let spinner = JHSpinnerView.showOnView(self.view, spinnerColor:UIColor.red, overlay:.fullScreen, overlayColor:UIColor.black.withAlphaComponent(0.6))
        
        switch(currentChatType)
        {
        case 0:
            ChatStore().getChat(eventId: DataSingleton.sharedInstance.currentEvent.id, callback: {
                conversations in
                
                spinner.dismiss()
                if(conversations.count > 0)
                {
                    self.currentIndex = conversations.count-1;
                    self.totalConversations = conversations;
                    self.conversations = conversations[conversations.count-1] as! [Chat];
                    self.tblChat.reloadData();
                    self.tblChat.tableViewScrollToBottom(animated: true);
                }
            
            })
        break;
        case 1:
            ChatStore().getAnnouncement(eventId: DataSingleton.sharedInstance.currentEvent.id, callback: {
                conversations in
                
                spinner.dismiss()
                if(conversations.count > 0)
                {
                    self.currentIndex = conversations.count-1;
                    self.totalConversations = conversations;
                    self.conversations = conversations[conversations.count-1] as! [Chat];
                    self.tblChat.reloadData();
                    self.tblChat.tableViewScrollToBottom(animated: true);
                }
              
            })
        break;
        default:
            break;
        }
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.conversations.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatCell;
        let tempChat = self.conversations[indexPath.row];
        if(currentChatType == 1)
        {
            cell.imgUser.isHidden = true;
            if(DataSingleton.sharedInstance.currentUser.isManager == true)
            {
                sendView.isHidden = false;
                tblMarginBottom.constant=85;
            }
            else
            {
                sendView.isHidden = true;
                tblMarginBottom.constant=0;
            }
        }
        else if(currentChatType == 0)
        {
            sendView.isHidden = false;
            tblMarginBottom.constant=85;
            if(tempChat.senderId == DataSingleton.sharedInstance.currentUser.id)
            {
                cell.imgUser.isHidden = true;
                cell.rightMargin.constant = 16;
                cell.leftMargin.constant = 90;
            }
            else
            {
                cell.imgUser.isHidden = false;
                cell.leftMargin.constant = 66;
                cell.rightMargin.constant = 40;
            }
 
        }
        
        cell.imgUser.layer.cornerRadius = cell.imgUser.frame.size.width/2;
        cell.imgUser.clipsToBounds = true;
        cell.imgUser.sd_setImage(with: URL(string:self.conversations[indexPath.row].senderImage))
        cell.tvContent.text = tempChat.content;
        
        return cell;
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
