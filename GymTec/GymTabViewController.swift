//
//  GymTabViewController.swift
//  GymTec
//
//  Created by cdt307 on 3/30/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//
/* Tutoriales:
 - https://www.youtube.com/watch?v=FMqX628vE1c
 - https://www.youtube.com/watch?v=pwZCksvXGRw
 */
import UIKit

class GymTabViewController: UIViewController {
    
    @IBOutlet weak var gymCollection: UICollectionView!
    
    let cellNames = ["Equipment", "Locate Gym"]
    var cellImages = ["dumbbell.png", "gym_edif.png"]
    var cellSegueIDs = ["equipment", "gym_map"]
    var estimateWidth = 250.0
    var cellMarginSize = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setBackground(url: "barbells_bg.jpg", target: self)
        //Set Delegates
        self.gymCollection.delegate = self
        self.gymCollection.dataSource = self
        
        // Register cells
        self.gymCollection.register(UINib(nibName: ("TrainerCell"), bundle: nil), forCellWithReuseIdentifier: "TrainerCell")
        
        // SetupGrid View
        self.setupGridView()
    }
    
    func setupGridView(){
        let flow = gymCollection.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboardID = cellSegueIDs[indexPath.row]
        let nextSegue = storyboard?.instantiateViewController(withIdentifier: storyboardID)
        self.navigationController?.pushViewController(nextSegue!, animated: true)
    }
}

extension GymTabViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gymCollection.dequeueReusableCell(withReuseIdentifier: "TrainerCell", for: indexPath) as! TrainerCell
        cell.setData(text: self.cellNames[indexPath.row])
        cell.setImage(url: self.cellImages[indexPath.row])
        
        return cell
    }
}

extension GymTabViewController : UICollectionViewDelegateFlowLayout{
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
