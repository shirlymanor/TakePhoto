//
//  TakePictureViewController.swift
//  TakePhoto
//
//  Created by Shirly Manor on 2/3/17.
//  Copyright © 2017 manor. All rights reserved.
//

import UIKit

class TakePictureViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            print("camera is on")
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            print("no camera")
        }

    }
    
    @IBAction func chooseFromLibrary(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
            
        }

    }
   
    @IBAction func saveBtn(_ sender: Any)
    {
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.6)
        let compressedJpgImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJpgImage!, nil, nil, nil)
        FinishSavePhoto()
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        imageView.contentMode = .scaleAspectFit //3
        imageView.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
    }
    func FinishSavePhoto()
    {
        let alertController = UIAlertController(title: "Saved", message: "Your Photo is been saved", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK",style: .default,handler:nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
    }
}
