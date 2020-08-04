//
//  ViewController.swift
//  WhatFlower
//
//  Created by Bailey Search on 31/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let safeImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = safeImage
            
            guard let ciimage = CIImage(image: safeImage) else {
                fatalError("Could not convert to CIImage")
            }
            
            detect(image: ciimage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            //guard let model = try? VNCoreMLModel(for: Resnet50().model) else {
            fatalError("Loading CoreML model failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            
            if let firstResult = results.first {
                if firstResult.identifier.contains("hotdog") {
                    self.title = "Hotdog"
                } else {
                    self.title = "Not A Hotdog"
                }
            }
            
            for result in results {
                print("\(result.confidence) - \(result.identifier)")
            }
            
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
        @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
            present(imagePicker, animated: true, completion: nil)
        }
}

