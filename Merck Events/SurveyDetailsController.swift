//
//  SurveyDetailsController.swift
//  Merck Events
//
//  Created by mac on 3/16/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import DLRadioButton
import JHSpinner

class SurveyDetailsController: UIViewController,UITextViewDelegate {
    var currentSurvey = Survey();
    var currentIndex:Int = 0;
    var questionsNumber:Int=0;
    @IBAction func onPreviousClicked(_ sender: Any) {
        if(currentIndex > 0)
        {
            currentIndex -= 1;
        }
        refreshQuestion();
    }
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var tvComment: UITextView!
    @IBOutlet weak var viewAnswers: UIView!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    var otherButtons : [DLRadioButton] = [];
    @IBAction func onNextClicked(_ sender: Any) {
        if(currentIndex < questionsNumber-1)
        {
            currentIndex += 1;
   
        }
        refreshQuestion();
    }
    @IBOutlet weak var lblQuestionContent: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionsNumber = currentSurvey.questions.count;
        refreshQuestion();
        // Do any additional setup after loading the view.
    }
    
    private func refreshQuestion()
    {
        otherButtons = [];
        var currentY:Int=10;
          btnSubmit.isHidden = true;
        if(currentIndex == questionsNumber-1)
        {
            btnNext.isHidden = true;
            btnSubmit.isHidden = false;
          
        }
            else
        {
            btnNext.isHidden = false;
        }
         if(currentIndex == 0)
        {
            btnPrev.isHidden = true;
        }
        else
         {
            btnPrev.isHidden = false;
        }
         lblQuestionContent.text = currentSurvey.questions[currentIndex].content;
        
        for view in viewAnswers.subviews
        {
            if view is DLRadioButton
            {
                  view.removeFromSuperview();
            }
          
        }
        if(currentSurvey.questions[currentIndex].type == "MSQ")
        {
            tvComment.isHidden = true;
            for answer in currentSurvey.questions[currentIndex].answers
            {
                let frame = CGRect(x: 5, y: currentY, width: 100, height: 17);
                let radioBtn = createRadioButton(frame: frame, title: answer.content);
                
                if(answer.id == currentSurvey.questions[currentIndex].questionResult.answerId)
                {
                    radioBtn.isSelected = true;
                }
                radioBtn.otherButtons = otherButtons;
                radioBtn.tag = answer.id;
                otherButtons.append(radioBtn);
                currentY += 30;
            }
        }
       else if (currentSurvey.questions[currentIndex].type=="comment")
        {
            tvComment.isHidden = false;
            //tvComment.text =
            tvComment.text = currentSurvey.questions[currentIndex].questionResult.resValue;
        }
       
    }
    func textViewDidChange(_ textView: UITextView) {
        currentSurvey.questions[currentIndex].questionResult.resValue = textView.text;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createRadioButton(frame : CGRect, title : String) ->DLRadioButton
    {
        let radioButton = DLRadioButton(frame: frame);
        radioButton.titleLabel!.font = UIFont.systemFont(ofSize: 14);
        radioButton.setTitle(title, for: UIControlState.normal);
        radioButton.setTitleColor(UIColor.black, for: UIControlState.normal);
        radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left;
        radioButton.addTarget(self, action: #selector(self.onAnswerClicked), for: UIControlEvents.touchUpInside)
    
        viewAnswers.addSubview(radioButton);
        return radioButton;
    }
    
    
    @objc private func onAnswerClicked(radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
            }
        } else {
            print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        }
        
        currentSurvey.questions[currentIndex].questionResult.resValue = radioButton.selected()!.titleLabel!.text!;
        currentSurvey.questions[currentIndex].questionResult.answerId = radioButton.selected()!.tag;
        
    }
    

    

    @IBAction func onSubmitClicked(_ sender: Any) {
         let spinner = JHSpinnerView.showOnView(self.view, spinnerColor:UIColor.red, overlay:.fullScreen, overlayColor:UIColor.black.withAlphaComponent(0.6))
        SurveyStore().post(survey: currentSurvey, callback: {
        success in
            if(success)
            {
                let vc = TransitionsHelper().getViewController(name: "surveysView");
                self.navigationController?.pushViewController(vc, animated: true);
            }
           
            print(success);
        })
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
