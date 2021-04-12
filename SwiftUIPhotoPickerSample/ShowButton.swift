//
//  ShowButton.swift
//  SwiftUIPhotoPickerSample
//
//  Created by chino on 2021/04/12.
//

import SwiftUI

struct ShowButton: View {
    @Binding var isShowLibrary: Bool
    
    var body: some View {
        Button(action: {
            isShowLibrary = true
        }, label: {
            HStack {
                Image(systemName: "photo")
                Text("Choose Photo")
            }
            .font(.title2)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10.0)
        })
    }
}

struct ShowButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowButton(isShowLibrary: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
