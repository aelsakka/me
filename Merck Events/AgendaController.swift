//
//  AgendaController.swift
//  Merck Events
//
//  Created by mac on 4/18/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class AgendaController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblAgenda: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSingleton.sharedInstance.currentEvent.getAgenda().count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "agendaCell") as! AgendaCell;
        let tempAgenda = DataSingleton.sharedInstance.currentEvent.getAgenda()[indexPath.row];
        cell.lblAgendaDate.text = tempAgenda.date;
        cell.lblFrom.text = tempAgenda.from;
        cell.lblTo.text = tempAgenda.to;
        cell.tvDesc.text = tempAgenda.subject;
        let color = UIColor(tempAgenda.color);
        cell.backgroundColor = color;

        
        
        if tempAgenda.date == ""
        {
            cell.lblAgendaDate.isHidden = true;
            cell.lblMarginTop.constant = 20;
            
        }
        else
        {
            cell.lblAgendaDate.isHidden = false;
            cell.lblMarginTop.constant = 38;
        }
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
