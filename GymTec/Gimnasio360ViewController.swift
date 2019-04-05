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
        let esfera = SCNSphere(radius: 4.0)
        let materialEsfera = SCNMaterial()
        
        materialEsfera.diffuse.contents = UIImage(named:"305HPanono - Conversion de energia.jpg")
        materialEsfera.isDoubleSided = true
        
        GYM.geometry = esfera
        GYM.geometry?.materials = [materialEsfera]
        GYM.position = SCNVector3(x:0, y:0, z:0)
        scene.rootNode.addChildNode(GYM)
        
        sceneView.scene = scene
        

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
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
