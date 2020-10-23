//
//  CameraViewController.swift
//  
//
//  Created by Grigori on 10/22/20.
//

import UIKit
import AlamofireImage

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSubmitButton(_ sender: Any) {
    }
    
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
                picker.delegate = self
                picker.allowsEditing = true
                
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    picker.sourceType = .camera
                    
                }else {
                    picker.sourceType = .photoLibrary
                }
                present(picker, animated: true, completion: nil)
                }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          let image = info [.editedImage] as! UIImage
          let size = CGSize(width: 300, height: 300)
          let scaledImage = image.af_imageScaled(to: size)
          
          imageView.image = scaledImage
          //dismiss camera view
          dismiss(animated: true, completion: nil)
      }

    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
