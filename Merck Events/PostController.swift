//
//  PostController.swift
//  Merck Events
//
//  Created by mac on 3/20/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import SDWebImage

class PostController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tvComment: UITextView!
    @IBAction func onAddCommentClicked(_ sender: Any) {
    }
    @IBOutlet weak var tblPost: UITableView!
    var currentImage:String="";
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width,  height:self.view.frame.size.height/1.5 );
        let view = UIView(frame:frame)
        let imageView = UIImageView();
        imageView.sd_setImage(with: URL(string:currentImage))
        imageView.frame = frame;
        view.backgroundColor = UIColor.black;
        view.addSubview(imageView);
        
        
        
        
        //  image.sd_setImage(with: URL(string:currentImage));
        tblPost.tableHeaderView = view;
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commentCell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! CommentCell;
        commentCell.imgUser.layer.cornerRadius = commentCell.imgUser.frame.size.width/2;
        commentCell.imgUser.clipsToBounds = true;
        let comment = getAttributedText(senderName: "Ahmed\n", content: "Hello", date: "2 Feb , 2017");
        commentCell.tvComment.attributedText = comment;
        return commentCell;
        
    }
    func getAttributedText(senderName:String,content:String,date:String) -> NSAttributedString
    {
        let attributedString = NSMutableAttributedString();
        let attributedName = NSMutableAttributedString(string: senderName);
        let nameRange = NSMakeRange(0, (senderName as! NSString).length)
        var paragraph = NSMutableParagraphStyle()
        
        
        attributedName.addAttribute(NSFontAttributeName, value: UIFont(name:"Verdana",size:17.0), range:nameRange);
        attributedName.addAttribute(NSForegroundColorAttributeName, value: Constants.merckYellowColor, range: nameRange);
        
        
        let attributedComment = NSMutableAttributedString(string: content+"\n");
        let contentRange = NSMakeRange(0, (content as! NSString).length)
        
        attributedComment.addAttribute(NSFontAttributeName, value: UIFont(name:"Verdana",size:15.0), range:contentRange);
        attributedComment.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGray, range: contentRange);
        
        let attributedDate = NSMutableAttributedString(string: date);
        let dateRange = NSMakeRange(0, (date as! NSString).length)
        
        attributedDate.addAttribute(NSFontAttributeName, value: UIFont(name:"Verdana",size:13.0), range:dateRange);
        attributedDate.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: dateRange);
        
        
        paragraph.alignment = .right
        attributedDate.addAttribute(NSParagraphStyleAttributeName, value: paragraph, range: dateRange);
        
        attributedString.append(attributedName);
        attributedString.append(attributedComment);
        attributedString.append(attributedDate);
        
        return attributedString;
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
