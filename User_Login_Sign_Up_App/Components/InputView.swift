//
//  InputView.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import SwiftUI

struct InputView: View {
	@Binding var text: String
	let title: String
	let placeholder: String
	let isSecureField: Bool
	
	var body: some View {
		VStack(alignment: .leading, spacing: 10){
			Text(title)
				.foregroundColor(Color.gray)
				.fontWeight(.semibold)
				.font(.footnote)
			
			if isSecureField {
				SecureField(placeholder, text: $text)
					.font(.system(size: 14))
			} else {
				TextField(placeholder, text: $text)
					.font(.system(size: 14))
			}
			Divider()
		}
	}
}

struct InputView_Previews: PreviewProvider {
	static var previews: some View {
		InputView(text: .constant(""), title: "Email address", placeholder: "Enter your email", isSecureField: false)
	}
}

