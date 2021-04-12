//
//  PhotoPicker.swift
//  SwiftUIPhotoPickerSample
//
//  Created by chino on 2021/04/12.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var seledtedImage: Image?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
    
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator

        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        private let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//            parent.isPresented = false
//
//            if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
//                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (uiImage, error) in
//                    DispatchQueue.main.async {
//                        guard let self = self, let uiImage = uiImage as? UIImage else { return }
//                        self.parent.seledtedImage = Image(uiImage: uiImage)
//                    }
//                }
//            }
//        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.isPresented = false
            
            let itemProvider = results.first?.itemProvider  // utemProvider is NSItemProvider? Type.
            
            if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    if let uiImage = image as? UIImage {
                        self.parent.seledtedImage = Image(uiImage: uiImage)
                    }
                }
            }
        }
    }
}
