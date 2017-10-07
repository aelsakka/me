//
//  GalleryController.swift
//  Merck Events
//
//  Created by mac on 3/19/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import BSGridCollectionViewLayout
import SDWebImage
import JHSpinner

class GalleryController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var cvGallery: UICollectionView!
    @IBOutlet weak var collectionViewGallery: UICollectionView!
   let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
//        let layout = GridCollectionViewLayout()
//        layout.itemsPerRow = 3
//        layout.itemSpacing = 2
//        layout.itemHeightRatio = 3/4
        
        
        let btnUpload = UIButton(type: .custom)
        btnUpload.setTitle("Upload", for: .normal);
        btnUpload.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        btnUpload.addTarget(self, action: #selector(self.onUploadClicked), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btnUpload)
        
        self.navigationItem.setRightBarButtonItems([item1],animated: true)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.size.width/3, height: self.view.frame.size.width/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionViewGallery.collectionViewLayout = layout
        

        
         let spinner = JHSpinnerView.showOnView(self.view, spinnerColor:UIColor.red, overlay:.fullScreen, overlayColor:UIColor.black.withAlphaComponent(0.6))
        
        GalleryStore().get(eventId: DataSingleton.sharedInstance.currentEvent.id)
        {
            gallery in
            DataSingleton.sharedInstance.currentEvent.setGallery(gallery: gallery);
           self.cvGallery.reloadData();
            spinner.dismiss();
            
        }
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataSingleton.sharedInstance.currentEvent.getGallery().count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let galleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryCell", for: indexPath) as! GalleryCell;
        galleryCell.imgPost.sd_setImage(with: URL(string:DataSingleton.sharedInstance.currentEvent.getGallery()[indexPath.row].imagePath));
        return galleryCell;
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TransitionsHelper().getViewController(name: "postView") as! PostController;
        vc.currentImage = DataSingleton.sharedInstance.currentEvent.getGallery()[indexPath.row].imagePath;
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    func onUploadClicked(_ sender: UIBarButtonItem)
    {
        print("Uploading");
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
        picker.popoverPresentationController?.barButtonItem = sender
        
    }
    func imagePickerController(_ picker: UIImagePickerController, 
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        picker.dismiss(animated: false);
        print(info);
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated:false);
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
