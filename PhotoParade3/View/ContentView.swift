//
//  ContentView.swift
//  photoParade
//
//  Created by Nam Anh Vũ on 2024-03-11.
//

import SwiftUI
import Photos

struct ContentView: View {
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    
    @StateObject private var photoFetcher = PhotoFetcher()

    @State private var photoOffset: CGSize = .zero
    @State private var animateOut = false
    @State private var refreshTrigger = false
    
    @State private var showingShareSheet = false
    @State private var itemsToShare: [Any] = []
    
    func likePhoto() {
        guard !self.photoFetcher.destinations.isEmpty else { return }
        
        // Some animation later
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if !self.photoFetcher.destinations.isEmpty {
                let tempPhoto = self.photoFetcher.destinations.removeLast()
                self.photoFetcher.destinations.insert(tempPhoto, at: 0)
            }
            photoOffset = .zero
            animateOut = false
        }
    }
    
    func dislikePhoto() {
        guard !self.photoFetcher.destinations.isEmpty else { return }
        
        let deletePhoto = self.photoFetcher.destinations.last?.asset
        
        guard let deleteAsset = deletePhoto else { return }
        
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.deleteAssets([deleteAsset] as NSArray)
        }) { success, error in
            
            DispatchQueue.main.async {
                if success {
                    self.photoFetcher.destinations.removeLast()
                    self.refreshTrigger.toggle()
                } else {
                    print("Error deleting photo")
                }
            }
        }
    }
    
    func sharePhoto() {
        guard let topAsset = photoFetcher.destinations.last?.asset else { return }
        
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.version = .current
        options.isSynchronous = false
        options.deliveryMode = .highQualityFormat
        
        manager.requestImage(for: topAsset, targetSize: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), contentMode: .aspectFit, options: options) { image, _ in
            if let image = image {
                DispatchQueue.main.async {
                    self.shareImage(image: image)
                }
                print("shareImage called")
            }
            }
    }
    
    func shareImage(image: UIImage) {
        itemsToShare = [image]
        showingShareSheet = true
        print("Item to share: \(itemsToShare)")
    }
    
    var body: some View {
        VStack{
            Spacer(minLength: 20)
            
            ZStack {
                ForEach(photoFetcher.destinations, id: \.id) { oldPic in
                    CardView(showGuideView: $showGuide, showInfoView: $showInfo, oldPics: oldPic)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            CardNav(onLike: {
                likePhoto()
            }, onDislike: {
                dislikePhoto()
            }, onShare: {
                sharePhoto()
            })

            Spacer(minLength: 20)
            
        }
        .onAppear(perform: photoFetcher.requestPhotoLibraryAccess)
        .alert(isPresented: $photoFetcher.showAlert) {
            Alert(
                title: Text("Permission required"),
                message: Text(photoFetcher.alertMessage),
                primaryButton: .default(Text("Settings"), action: {
                    // Open the app's settings
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                }),
                secondaryButton: .cancel()
            )
        }
        .sheet(isPresented: $showingShareSheet) {
            ActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        }
        
    }
}

#Preview {
    ContentView()
}
