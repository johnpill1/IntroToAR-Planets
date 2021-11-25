//
//  ViewController.swift
//  IntroToAR
//
//  Created by John Pill on 25/11/2021.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        addEarthToScene()
        addMarsToScene()
        addVenusToScene()
        addMoonToScene()
        addJupiterToScene()
        addMercuryToScene()
        addSunToScene()
        addEarthText()
    }
    
    // MARK: - PLANETS
    
    let rotateAction = SCNAction.rotateBy(x: 0, y: 0.25, z: 0, duration: 2.0)


    private func addSunToScene() {
        
        let sunSphere = SCNSphere(radius: 4)
        sunSphere.firstMaterial?.diffuse.contents = UIImage(named: "8k_sun")
        
        let sunSphereNode = SCNNode(geometry: sunSphere)

        sunSphereNode.position = SCNVector3(-15, 0, -1)
        sunSphereNode.runAction(SCNAction.repeatForever(rotateAction))

        sceneView.scene.rootNode.addChildNode(sunSphereNode)

    
    }
    
    
    private func addEarthToScene() {
        
        let earthSphere = SCNSphere(radius: 0.2)
        earthSphere.firstMaterial?.diffuse.contents = UIImage(named: "8k_earth_daymap")
        
        let earthSphereNode = SCNNode(geometry: earthSphere)

        earthSphereNode.position = SCNVector3(0, 0, -1)
        earthSphereNode.runAction(SCNAction.repeatForever(rotateAction))

        sceneView.scene.rootNode.addChildNode(earthSphereNode)
        
        
    }
    
    
    
    private func addMoonToScene() {
        
        let moonSphere = SCNSphere(radius: 0.08)
        moonSphere.firstMaterial?.diffuse.contents = UIImage(named: "8k_moon")
        
        let moonSphereNode = SCNNode(geometry: moonSphere)

        moonSphereNode.position = SCNVector3(0, 0, -2)
        moonSphereNode.runAction(SCNAction.repeatForever(rotateAction))

        sceneView.scene.rootNode.addChildNode(moonSphereNode)
    }
    
    
    
    private func addMarsToScene() {
        
        let marsSphere = SCNSphere(radius: 0.13)
        marsSphere.firstMaterial?.diffuse.contents = UIImage(named: "8k_mars")
        
        let marsSphereNode = SCNNode(geometry: marsSphere)

        marsSphereNode.position = SCNVector3(1, 0, -1)
        marsSphereNode.runAction(SCNAction.repeatForever(rotateAction))
        
        sceneView.scene.rootNode.addChildNode(marsSphereNode)
        
    }
    private func addMercuryToScene() {
        
        let mercurySphere = SCNSphere(radius: 0.13)
        mercurySphere.firstMaterial?.diffuse.contents = UIImage(named: "8k_mercury")
        
        let mercurySphereNode = SCNNode(geometry: mercurySphere)

        mercurySphereNode.position = SCNVector3(-2, 0, -1)
        mercurySphereNode.runAction(SCNAction.repeatForever(rotateAction))
        
        sceneView.scene.rootNode.addChildNode(mercurySphereNode)
        
    }
    
    
    private func addVenusToScene() {
        
        let venusSphere = SCNSphere(radius: 0.13)
        venusSphere.firstMaterial?.diffuse.contents = UIImage(named: "8k_venus_surface")
        
        let venueSphereNode = SCNNode(geometry: venusSphere)

        venueSphereNode.position = SCNVector3(-1, 0, -1)
        venueSphereNode.runAction(SCNAction.repeatForever(rotateAction))
        
        sceneView.scene.rootNode.addChildNode(venueSphereNode)
        
    }
    
    
    private func addJupiterToScene() {
        
        let jupiterSphere = SCNSphere(radius: 1)
        jupiterSphere.firstMaterial?.diffuse.contents = UIImage(named: "8k_jupiter")
        
        let jupiterSphereNode = SCNNode(geometry: jupiterSphere)

        jupiterSphereNode.position = SCNVector3(5, 0, -1)
        jupiterSphereNode.runAction(SCNAction.repeatForever(rotateAction))
        
        sceneView.scene.rootNode.addChildNode(jupiterSphereNode)
        
    }
    
    // MARK: - TEXT
    
    //Earth Text
    private func addEarthText() {
        let text = SCNText(string: "Earth", extrusionDepth: 1.5)
    let material = SCNMaterial()
    material.diffuse.contents = UIColor.black
    text.materials = [material]
        text.font = UIFont(name: "Arial", size: 8)


    let node = SCNNode()
        node.position = SCNVector3(x:-0.10, y:0.2, z:-1)
 node.scale = SCNVector3(x:0.01, y:0.01, z:0.01)


    node.geometry = text
    sceneView.scene.rootNode.addChildNode(node)
    sceneView.autoenablesDefaultLighting = true
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
