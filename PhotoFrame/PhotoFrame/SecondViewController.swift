//
//  SecondViewController.swift
//  PhotoFrame
//
//  Created by 윤동민 on 17/12/2018.
//  Copyright © 2018 윤동민. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoFrame: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let frame = "photoframe-border.png"
        let initialImage = "01.jpg"
        self.photoImageView.image = UIImage(named: initialImage)
        self.photoFrame.image = UIImage(named: frame)
    }

    @IBAction func nextImageTouched(_ sender: Any) {
        let imageName: String = String(format: "%02d", Int(arc4random_uniform(22))+1) + ".jpg"
        self.photoImageView.image = UIImage(named: imageName)
    }
    
    @IBAction func selectButtonTouched(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        
        let alert = UIAlertController(title: "가져올 곳", message: "선택하시오", preferredStyle: .actionSheet)
        
        let albumPickAction = UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary(picker) }
        let cameraPickAction = UIAlertAction(title: "카메라", style: .default) { (action) in self.openCamera(picker) }
        let cancelPickAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cameraPickAction)
        alert.addAction(albumPickAction)
        alert.addAction(cancelPickAction)
    
        present(alert, animated: true, completion: nil)
    }
    
    private func openLibrary(_ picker: UIImagePickerController) {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    private func openCamera(_ picker: UIImagePickerController) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        } else {
            let warningAlert = UIAlertController(title: "주의", message: "카메라 기능에 접근할 수 없습니다.", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            warningAlert.addAction(okayAction)
            present(warningAlert, animated: true, completion: nil)
        }
    }
}

extension SecondViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.image = pickImage
        }
        dismiss(animated: true, completion: nil)
    }
}
