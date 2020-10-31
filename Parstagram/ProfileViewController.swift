//
//  ProfileViewController.swift
//  Parstagram
//
//  Created by Grigori on 10/30/20.
//

import UIKit
import AlamofireImage
import Parse

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var profilePhotoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       }
    

    @IBAction func addPhotoButton(_ sender: Any) {
        let user = PFObject(className: "User")
               //create arbitrary key "caption", "author"
                      
               let imageData = profilePhotoView.image!.pngData()
               let file = PFFileObject(data: imageData!)
               user["profileImage"] = file
               //save the object ("post")to the table
               user.saveInBackground{(success, error) in
                   if success {
                       self.dismiss(animated: true, completion: nil)
                       print("Saved profile photo")
                   } else {
                       print ("Error profile photo")
                   }
           }
               
        
           }

    
    @IBAction func onProfilePictureTap(_ sender: Any) {
        let picker = UIImagePickerController()
                picker.delegate = self
                picker.allowsEditing = true
                //check if camera is available, if not then use photoLibrary
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    picker.sourceType = .camera
                    
                }else {
                    picker.sourceType = .photoLibrary
                }
                present(picker, animated: true, completion: nil)
                }
            
            //function to display image
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info [.editedImage] as! UIImage
            let size = CGSize(width: 300, height: 300)
            let scaledImage = image.af_imageAspectScaled(toFill: size)
            
            profilePhotoView.image = scaledImage
            //dismiss camera view
            dismiss(animated: true, completion: nil)
        }
    }
    
    
