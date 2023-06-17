//
//  CustomButtonView.swift
//  StateAnaDataFlow
//
//  Created by Юлия Ястребова on 17.06.2023.
//

import SwiftUI

struct CustomButtonView: View {
    let text: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        }
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(
            text: "Start",
            color: .gray,
            action: {}
        )
    }
}
