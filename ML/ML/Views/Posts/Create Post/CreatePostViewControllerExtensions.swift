//
//  CreatePostViewControllerExtensions.swift
//  ML
//
//  Created by Arteezy on 5/11/22.
//

import Foundation
import PhotosUI

protocol CreatePostViewControllerDelegate {
    func cancelButtonPressed()
    func addImageButtonPressed()
}

extension CreatePostViewController: CreatePostViewControllerDelegate {
    
    func cancelButtonPressed() {
        NotificationCenter.default.post(name: .createPostCancelButtonPressed, object: nil)
//        NotificationCenter.default.post(name: .marketAddItemCancelButtonPressed, object: nil)
    }
    
    
    func addImageButtonPressed() {
                
        var configration = PHPickerConfiguration()
        configration.filter = .images
        
        let picker = PHPickerViewController(configuration: configration)
        picker.delegate = self
        present(picker, animated: true)
        

    }
    
}

extension CreatePostViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        
        dismiss(animated: true)
        
        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            
            itemProvider.loadObject(ofClass: UIImage.self) {  image , error in
                
                guard let image = image as? UIImage else { return }
                    
                NotificationCenter.default.post(name: .createPostUserImageChanged, object: image)
                
            }
        
        }
    }
    
    
}
