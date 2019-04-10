//
//  ThreeSixtyVideoViewController.swift
//  GymTec
//
//  Created by cdt307 on 3/29/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//
import UIKit
import SceneKit
import ARKit
import AVFoundation


class ThreeSixtyVideoViewController: UIViewController, ARSCNViewDelegate {

    
<<<<<<< HEAD
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet var sceneView: ARSCNView!
    
    let player = AVPlayer(url: URL(string: "http://all360media.com/wp-content/uploads/pano/laphil/media/video-ios.mp4")!)
    
=======
    @IBOutlet var sceneView: ARSCNView!
>>>>>>> GermanBranch
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
<<<<<<< HEAD
        activity.isHidden = true
        
=======
>>>>>>> GermanBranch
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        registerGestureRecognizer()
    }
    
    private func registerGestureRecognizer()
    {
        let tapGesto = UITapGestureRecognizer(target: self, action: #selector(tapEnPantalla))
        self.sceneView.addGestureRecognizer(tapGesto)
    }
    
    @objc func tapEnPantalla(manejador:UIGestureRecognizer)
    {
        
<<<<<<< HEAD
        player.volume = 0.5
        
        // crear un nodo capaz de reporducir un video
        let videoNodo = SKVideoNode(avPlayer: player)

        videoNodo.play() //ejecutar play al momento de presentarse
        
        activity.isHidden = false
        activity.startAnimating()
        
        player.addObserver(self, forKeyPath: "timeControlStatus", options: [.old, .new], context: nil)
        
=======
        let moviePath = "http://all360media.com/wp-content/uploads/pano/laphil/media/video-ios.mp4"
        let url = URL(string: moviePath)
        let player = AVPlayer(url: url!)
        player.volume = 0.5
        print(player.isMuted)
        
        // crear un nodo capaz de reporducir un video
        let videoNodo = SKVideoNode(url: url!)
        //let videoNodo = SKVideoNode(fileNamed: "CheeziPuffs.mov")
        //let videoNodo = SKVideoNode(avPlayer: player)
        videoNodo.play() //ejecutar play al momento de presentarse
        
>>>>>>> GermanBranch
        //crear una escena sprite kit, los parametros estan en pixeles
        let spriteKitEscene =  SKScene(size: CGSize(width: 2480, height: 3508 ))
        spriteKitEscene.addChild(videoNodo)
        
        //colocar el videoNodo en el centro de la escena tipo SpriteKit
        videoNodo.position = CGPoint(x: spriteKitEscene.size.width/2, y: spriteKitEscene.size.height/2)
        videoNodo.size = spriteKitEscene.size
        
        //crear una pantalla 4/3, los parametros son metros
        let pantalla = SCNPlane(width: 1.0, height: 0.75)
        
        //pantalla.firstMaterial?.diffuse.contents = UIColor.blue
        //modificar el material del plano
        pantalla.firstMaterial?.diffuse.contents = spriteKitEscene
        //permitir ver el video por ambos lados
        pantalla.firstMaterial?.isDoubleSided = true
        
        //let pantallaPlanaNodo = SCNNode(geometry: pantalla)
        //Abajo
        let esfera = SCNSphere(radius: 20.0)
        let materialTierra = SCNMaterial()
        materialTierra.diffuse.contents = spriteKitEscene
        materialTierra.isDoubleSided = true
        var transform = SCNMatrix4MakeRotation(Float.pi, 0.0, 0.0, 1.0)
        transform = SCNMatrix4Translate(transform, 1.0, 1.0, 0)
        materialTierra.diffuse.contentsTransform = transform
        let tierra = SCNNode()
        tierra.geometry = esfera
        tierra.geometry?.materials = [materialTierra]
        tierra.position = SCNVector3(x:0, y:0, z:0)
        
        //identificar en donde se ha tocado el currentFrame
        var traduccion = matrix_identity_float4x4
        //definir un metro alejado del dispositivo
        traduccion.columns.3.z = -1.0
        
        //  --> pantallaPlanaNodo.simdTransform = matrix_multiply(currentFrame.camera.transform, traduccion)
        
        //---> pantallaPlanaNodo.eulerAngles = SCNVector3(Double.pi, 0, 0)
        self.sceneView.scene.rootNode.addChildNode(tierra)
        
    }
<<<<<<< HEAD
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "timeControlStatus" {
                if #available(iOS 10.0, *) {
                    if player.timeControlStatus == .playing {
                        activity.isHidden = true
                        activity.stopAnimating()
                    } else {
                        activity.isHidden = false
                        activity.startAnimating()
                    }
                }
            }
        }
    
=======
>>>>>>> GermanBranch
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
<<<<<<< HEAD
        player.removeObserver(self, forKeyPath: "timeControlStatus")
=======
>>>>>>> GermanBranch
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
}
