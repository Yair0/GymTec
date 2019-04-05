//
//  Gimnasio360ViewController.swift
//  GymTec
//
//  Created by cdt307 on 4/4/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//
import UIKit
import SceneKit
import ARKit


class Gimnasio360ViewController: UIViewController, ARSCNViewDelegate {

    
    @IBOutlet weak var sceneView: ARSCNView!
    let GYM = SCNNode()
    
    @objc func escalado(recognizer:UIPinchGestureRecognizer)
    {
        
        GYM.scale = SCNVector3(recognizer.scale, recognizer.scale, recognizer.scale)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
        
        let scene = SCNScene()
        let esfera = SCNSphere(radius: 3.0)
        let materialEsfera = SCNMaterial()
        
        materialEsfera.diffuse.contents = UIImage(named:"305HPanono - Conversion de energia.jpg")
        materialEsfera.isDoubleSided = true
        
        GYM.geometry = esfera
        GYM.geometry?.materials = [materialEsfera]
        GYM.geometry?.firstMaterial?.specular.contents = UIColor.white
        GYM.position = SCNVector3(x:0, y:0, z:0)
        scene.rootNode.addChildNode(GYM)
        
        let pinchGestureRecognizer = UIPinchGestureRecognizer (target: self, action: #selector(escalado))
        
        sceneView.addGestureRecognizer(pinchGestureRecognizer)
        
        sceneView.scene = scene
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
