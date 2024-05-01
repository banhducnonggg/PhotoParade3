//
//  PhotoFetcher.swift
//  PhotoParade3
//
//  Created by Nam Anh Vũ on 2024-03-18.
//

import Foundation
import Photos
import SwiftUI

class PhotoFetcher: ObservableObject {
    @Published var destinations: [Destination] = []
    @Published var showAlert = false
    @Published var alertMessage = ""

    func handleDeniedAccess() {
        alertMessage = "This app requires access to your photo library to function properly. Please grant access in Settings."
        showAlert = true
    }
    
    func formatDate(_ date: Date?) -> String {
        guard let date = date else { return "Unknown Date" }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
    
    func requestPhotoLibraryAccess() {
        PHPhotoLibrary.requestAuthorization {
            status in
            DispatchQueue.main.async {
                if status == .authorized {
                    self.fetchPhotos()
                } else {
                    // Do something
                    self.handleDeniedAccess()
                }
            }
        }
    }
    
    private func fetchPhotos() {
        var fetchDestinations: [Destination] = []
        
        // Fetching logic
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let assets = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        
        let imageManager = PHCachingImageManager()
        assets.enumerateObjects {
            ( asset, _, _) in
            let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = true
            requestOptions.deliveryMode = .highQualityFormat
            
            imageManager.requestImage(for: asset, targetSize: CGSize(width: 369, height: 500), contentMode: .aspectFill, options: requestOptions) {
                image, _ in
                if let image = image {
                    let name = asset.value(forKey: "filename") as? String ?? "Unknown"
                    let dateFormatted = self.formatDate(asset.creationDate)
                    let fetchDestination = Destination(asset: asset, name: name, date: dateFormatted, img: Image(uiImage: image))
                    fetchDestinations.append(fetchDestination)
                }
            }
        }
        
        
        DispatchQueue.main.async {
            self.destinations = fetchDestinations.shuffled()
        }
    }
}
