//
//  DisplayAttachmentController.swift
//  Merck Events
//
//  Created by mac on 3/9/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import JHSpinner

class DisplayAttachmentController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var wvAttachment: UIWebView!
    var attachmentUrl:String = "";
    var spinner:JHSpinnerView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner = JHSpinnerView.showOnView(self.view, spinnerColor: Constants.merckYellowColor, overlay: .fullScreen, overlayColor: UIColor.black.withAlphaComponent(0.6));
        self.view.addSubview(spinner);
        if(attachmentUrl != "")
        {
            wvAttachment.loadRequest(URLRequest(url: URL(string:attachmentUrl)!)); 
        }
       
        // Do any additional setup after loading the view.
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinner.dismiss();
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
