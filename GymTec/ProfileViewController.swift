//
//  ProfileViewController.swift
//  GymTec
//
//  Created by cdt307 on 3/16/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var profileCollection: UICollectionView!
    let cellNames = ["Profile QR", "Scan friend QR", "Edit profile", "Trophies"]
    var cellImages = ["scan_qr_profile.png", "qr_cel.png", "tablet.png", "award.png"]
    var cellSegueIDs = ["profile_qr", "scan_qr", "edit_profile", "achievements"]
    var estimateWidth = 150.0
    var cellMarginSize = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setBackground(url: "grey_bg.jpeg", target: self)
        //Set Delegates
        self.profileCollection.delegate = self
        self.profileCollection.dataSource = self
        
        // Register cells
        self.profileCollection.register(UINib(nibName: ("TrainerCell"), bundle: nil), forCellWithReuseIdentifier: "TrainerCell")
        
        // SetupGrid View
        self.setupGridView()
    }
    
    func setupGridView(){
        let flow = profileCollection.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboardID = cellSegueIDs[indexPath.row]
        let nextSegue = storyboard?.instantiateViewController(withIdentifier: storyboardID)
        self.navigationController?.pushViewController(nextSegue!, animated: true)
    }
}

extension ProfileViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = profileCollection.dequeueReusableCell(withReuseIdentifier: "TrainerCell", for: indexPath) as! TrainerCell
        cell.setData(text: self.cellNames[indexPath.row])
        cell.setImage(url: self.cellImages[indexPath.row])
        
        return cell
    }
}

extension ProfileViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWidth()
        return CGSize(width: width, height: width)
    }
    
    func calculateWidth() -> CGFloat{
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width) / estimatedWidth)
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
}
