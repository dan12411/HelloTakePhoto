//
//  ViewController.swift
//  HelloTakePhoto
//
//  Created by 洪德晟 on 2016/10/7.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

// 3. import
import MobileCoreServices
import Photos

// 2. Set Protocol
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // 1. Set image & button
    @IBOutlet weak var myImage: UIImageView!
    
    @IBAction func takePhoto(_ sender: UIButton) {
        
        // 7. Check has camera or Not
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            // 4. Generate image picker controller
            let imagePicker = UIImagePickerController()
            // 5. Set sourceType & delegate property
            imagePicker.sourceType = .camera
//            // 5-1. 叫出相機膠卷
//            imagePicker.sourceType = .photoLibrary
            
            imagePicker.delegate = self
            // 6. Present imagePicker
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // 7. 從info參數拿到照相的 image
        if let okImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // 8. 設定畫面上的imageView是我們照的照片
            myImage.image = okImage
            // 9. 存檔
            UIImageWriteToSavedPhotosAlbum(okImage, nil, nil, nil)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

