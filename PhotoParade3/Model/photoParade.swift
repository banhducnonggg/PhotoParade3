//
//  photoParade.swift
//  photoParade3
//
//  Created by Nam Anh Vũ on 2024-03-11.
//

import SwiftUI
import Photos

struct Destination: Identifiable {
    let id: UUID = UUID()
    var asset: PHAsset
    var name: String
    var date: String
    var img: Image
}
