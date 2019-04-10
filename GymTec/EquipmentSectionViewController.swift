//
//  EquipmentSectionViewController.swift
//  GymTec
//
//  Created by periodismo on 03/04/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit

class EquipmentSectionViewController: UIViewController {
    @IBOutlet weak var equipmentCollection: UICollectionView!
    
    let cellNames = ["Identify Equipment", "Scan Exercise QR", "360 View", "Report equipment"]
    var cellImages = ["chest.png", "qr_cel.png", "360-degrees.png", "clipboard-2.png"]
    var cellSegueIDs = ["identify_equipment", "scan_exercise", "360_view", "report_equipment"]
    var estimateWidth = 150.0
    var cellMarginSize = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setBackground(url: "grey_bg.jpeg", target: self)
        //Set Delegates
        self.equipmentCollection.delegate = self
        self.equipmentCollection.dataSource = self
        
        // Register cells
        self.equipmentCollection.register(UINib(nibName: ("TrainerCell"), bundle: nil), forCellWithReuseIdentifier: "TrainerCell")
        
        // SetupGrid View
        self.setupGridView()
    }
    
    func setupGridView(){
        let flow = equipmentCollection.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboardID = cellSegueIDs[indexPath.row]
        let nextSegue = storyboard?.instantiateViewController(withIdentifier: storyboardID)
        self.navigationController?.pushViewController(nextSegue!, animated: true)
    }
}

extension EquipmentSectionViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = equipmentCollection.dequeueReusableCell(withReuseIdentifier: "TrainerCell", for: indexPath) as! TrainerCell
        cell.setData(text: self.cellNames[indexPath.row])
        cell.setImage(url: self.cellImages[indexPath.row])
        
        return cell
    }
}

extension EquipmentSectionViewController : UICollectionViewDelegateFlowLayout{
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
