//
//  TrainerTabViewController.swift
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

class TrainerTabViewController: UIViewController {
    
    @IBOutlet weak var trainerCollection: UICollectionView!
    
    let cellNames = ["Routine", "Request Coach"]
    var cellImages = ["clipboard.png", "trainer_request.png"]
    var cellSegueIDs = ["routines", "trainer"]
    var estimateWidth = 250.0
    var cellMarginSize = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setBackground(url: "barbells_bg.jpg", target: self)
        //Set Delegates
        self.trainerCollection.delegate = self
        self.trainerCollection.dataSource = self
        
        // Register cells
        self.trainerCollection.register(UINib(nibName: ("TrainerCell"), bundle: nil), forCellWithReuseIdentifier: "TrainerCell")
        
        // SetupGrid View
        self.setupGridView()
    }
    
    func setupGridView(){
        let flow = trainerCollection.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboardID = cellSegueIDs[indexPath.row]
        let nextSegue = storyboard?.instantiateViewController(withIdentifier: storyboardID)
        self.navigationController?.pushViewController(nextSegue!, animated: true)
    }
}

extension TrainerTabViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = trainerCollection.dequeueReusableCell(withReuseIdentifier: "TrainerCell", for: indexPath) as! TrainerCell
        cell.setData(text: self.cellNames[indexPath.row])
        cell.setImage(url: self.cellImages[indexPath.row])
        
        return cell
    }
}

extension TrainerTabViewController : UICollectionViewDelegateFlowLayout{
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
