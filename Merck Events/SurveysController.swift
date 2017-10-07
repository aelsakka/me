//
//  SurveysController.swift
//  Merck Events
//
//  Created by mac on 3/16/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import JHSpinner

class SurveysController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblSurveys: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
     
    }
    func back(sender: UIBarButtonItem) {
        let vc = TransitionsHelper().getViewController(name: "eventView");
        self.navigationController?.pushViewController(vc, animated: true);
    }
    override func viewWillAppear(_ animated: Bool) {
        let spinner = JHSpinnerView.showOnView(self.view, spinnerColor:UIColor.red, overlay:.fullScreen, overlayColor:UIColor.black.withAlphaComponent(0.6))
        SurveyStore().get(eventId: DataSingleton.sharedInstance.currentEvent.id, userId: DataSingleton.sharedInstance.currentUser.id, callback: {
            surveys in
            spinner.dismiss();
            DataSingleton.sharedInstance.currentEvent.setSurveys(surveys: surveys);
            self.tblSurveys.reloadData();
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSingleton.sharedInstance.currentEvent.getSurveys().count;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TransitionsHelper().getViewController(name: "surveyDetailsView") as! SurveyDetailsController;
        vc.currentSurvey = DataSingleton.sharedInstance.currentEvent.getSurveys()[indexPath.row];
//        vc.currentSurvey = SurveysMapper().copy(survey: DataSingleton.sharedInstance.currentEvent.getSurveys()[indexPath.row])
       // print(DataSingleton.sharedInstance.currentEvent.getSurveys()[indexPath.row].copy());
        self.navigationController?.pushViewController(vc, animated: true);
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "surveyCell") as! SurveyCell;
        let tempSurvey = SurveysMapper().copy(survey: DataSingleton.sharedInstance.currentEvent.getSurveys()[indexPath.row]);
        if let cName = tempSurvey.creatorName as? String
        {
           cell.lblCreatorName.text = cName;
        }
        if let title = tempSurvey.title as? String
        {
             cell.lblSurveyName.text = title;
        }
        
      
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
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
