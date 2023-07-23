//
//  SettingRowView.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import SwiftUI

struct SettingRowView: View {
	let imageName: String
	let title: String
	let tinColor: Color
	
    var body: some View {
		HStack(spacing: 10) {
			Image(systemName: imageName)
				.imageScale(.small)
				.font(.title)
				.foregroundColor(tinColor)
			Text(title)	
				.font(.subheadline)
				.foregroundColor(.black)
		}
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
		SettingRowView(imageName: "arrow.left.arrow.right.circle.fill", title: "test", tinColor: .blue)
    }
}
