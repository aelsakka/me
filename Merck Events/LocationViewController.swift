//
//  LocationViewController.swift
//  Merck Events
//
//  Created by mac on 3/9/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import GoogleMaps

class LocationViewController: UIViewController {

    @IBOutlet weak var wvLocation: UIWebView!
    @IBOutlet weak var mapEvent: GMSMapView!
    var mapCoords:MapCoords = MapCoords()
    override func viewDidLoad() {
        super.viewDidLoad()
//        let camera = GMSCameraPosition.camera(withLatitude:  mapCoords.longitude as CLLocationDegrees  , longitude: mapCoords.latitude as CLLocationDegrees , zoom: 15)
//        mapEvent.camera = camera;
        
//        mapEvent.animate(toLocation: CLLocationCoordinate2D(latitude: 30, longitude: 31))

        print(DataSingleton.sharedInstance.currentEvent.mapLink);
        
        wvLocation.loadRequest(URLRequest(url: URL(string:DataSingleton.sharedInstance.currentEvent.mapLink)!) )
        ;
        

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
