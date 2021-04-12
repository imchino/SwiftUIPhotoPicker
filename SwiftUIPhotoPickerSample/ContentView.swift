//
//  ContentView.swift
//  SwiftUIPhotoPickerSample
//
//  Created by chino on 2021/04/12.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowPhotoLibrary = false
    @State var image: Image?
    
    var body: some View {
        ZStack {
            image?
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                Spacer()
                ShowButton(isShowLibrary: $isShowPhotoLibrary)
            }
        }
        .sheet(isPresented: $isShowPhotoLibrary, content: {
            PhotoPicker(isPresented: $isShowPhotoLibrary, seledtedImage: $image)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
