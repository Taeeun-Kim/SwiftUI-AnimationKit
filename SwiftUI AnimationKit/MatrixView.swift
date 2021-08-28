//
//  MatrixView.swift
//  SwiftUI AnimationKit
//
//  Created by Taeeun Kim on 28.08.21.
//

import SwiftUI

struct MatrixView: View {
    
    @State private var onMatrix: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            HStack {
                ForEach(1...20, id: \.self) { _ in
                    VStack(spacing: 0) {
                        ForEach(1...40, id: \.self) { _ in
                            VStack {
                                Text(randomString(length: 1))
                                    .foregroundColor(Color(red: 127/255, green: 237/255, blue: 82/255))
                                    .font(.system(size: CGFloat(Int.random(in: 5..<20))))
                                    .opacity(onMatrix ? 1 : 0)
                                    .animation(Animation.easeOut(duration: 0.5)
                                                .delay(Double.random(in: 0.1...3))
                                                .repeatForever())
                            }
                        }
                    }
                }
            }
            VStack {
                Spacer()
                Button(action: {
                    onMatrix.toggle()
                }, label: {
                    Text("Matrix")
                        .foregroundColor(Color(red: 127/255, green: 237/255, blue: 82/255))
                })
            }
        }
    }
    func randomString(length: Int) -> String {
        let letters = "0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

struct MatrixView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixView()
    }
}
