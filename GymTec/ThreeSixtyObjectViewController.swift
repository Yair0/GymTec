//
//  ThreeSixtyObjectViewController.swift
//  GymTec
//
//  Created by periodismo on 4/5/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ThreeSixtyObjectViewController: UIViewController, ARSCNViewDelegate {

    
    @IBOutlet var sceneView: ARSCNView!
    var mancuerna = SCNNode()
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        let currentScene = sender.view as! SCNView
        let location = sender.location(in: currentScene)
        let hitResults = currentScene.hitTest(location, options: [:])
        if !hitResults.isEmpty{
            let touchedNode = hitResults[0].node
            touchedNode.eulerAngles = SCNVector3Make(0, 1, 0)
        }
    }
    
    @IBAction func rotationGesture(_ sender: UIRotationGestureRecognizer) {
        mancuerna.eulerAngles = SCNVector3(0, sender.rotation, 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Asignar el View Delegate a la escena
        sceneView.delegate = self
        // Mostrar información de FPS y timing
        sceneView.showsStatistics = true
        
        // Crear objeto de mancuerna
        let scene = SCNScene()
        
        if let filePath = Bundle.main.path(forResource: "pug", ofType: "dae", inDirectory: "art.scnassets"){
            // ReferenceNode path -> ReferenceNode URL
            let referenceURL = URL(fileURLWithPath: filePath)
            // Crear nodo de referencia
            let referenceNode = SCNReferenceNode(url: referenceURL)
            referenceNode?.load()
            mancuerna = referenceNode!
        }
        
        
         let materialMancuerna = SCNMaterial()
         materialMancuerna.diffuse.contents = UIImage(named:"pug_tex.jpg")
        mancuerna.geometry?.materials = [materialMancuerna]
        
        mancuerna.position = SCNVector3(0, 0, -0.5)
        scene.rootNode.addChildNode(mancuerna)
        
        //Asignar la mancuerna a la vista
        sceneView.scene = scene
    }
    
    @objc func resize(recognizer:UIPinchGestureRecognizer)
    {
        
        mancuerna.scale = SCNVector3(recognizer.scale, recognizer.scale, recognizer.scale)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Crear sesión de configuración
        let configuration = ARWorldTrackingConfiguration()
        
        // Correr la sesión de la view
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pausar la sesión de la view
        // Por si el usuario se sale de la app
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
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
