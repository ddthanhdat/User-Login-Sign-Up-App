//
//  RegisterView.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import SwiftUI

struct RegisterView: View {
	@StateObject var viewModel = RegisterViewViewModel()
	@Environment(\.dismiss) var dismiss
	@EnvironmentObject var mainViewViewModel: MainViewViewModel
	
	var body: some View {
		VStack {
			//Image
			Image("firebase_logo")
				.resizable()
				.scaledToFit()
				.frame(width: 100, height: 100)
				.padding(.vertical, 30)
						
			// Fields
			VStack(spacing: 20) {
				InputView(text: $viewModel.email, title: "Email address:", placeholder: "abc@email.com", isSecureField: false)
					.autocapitalization(.none)
				InputView(text: $viewModel.fullname, title: "Fullname:", placeholder: "Enter your name", isSecureField: false)
					.autocapitalization(.none)
				InputView(text: $viewModel.password, title: "Password:", placeholder: "Enter your password", isSecureField: true)
				ZStack(alignment: .trailing) {
					InputView(text: $viewModel.confirmPassword, title: "Confirm Password:", placeholder: "Confirm your password", isSecureField: true)
					
					if (!viewModel.confirmPassword.isEmpty) {
						if (viewModel.isValidConfirmPassword()) {
							Image(systemName: "checkmark.circle.fill")
								.fontWeight(.bold)
								.foregroundColor(.green)
						} else {
							Image(systemName: "xmark.circle.fill")
								.fontWeight(.bold)
								.foregroundColor(.red)
						}
					}
				}
			}
			.padding(.horizontal)
			.padding(.top, 12)
			
			
			// button Sign in
			
			Button {
				viewModel.signUp()
				
			} label: {
				HStack {
					Text("SIGN UP")
						.fontWeight(.semibold)
					Image(systemName: "arrow.right.square")
						.fontWeight(.bold)
				}
				.foregroundColor(.white)
				.frame(width: UIScreen.main.bounds.width - 32, height: 48)
				
			}.background(Color.blue)
				.cornerRadius(10)
				.padding(.top, 20)
				.disabled(!viewModel.isValidForm)
				.opacity(viewModel.isValidForm ? 1.0 : 0.5)
			
			Spacer()
			
			// button Sign up
			Button {
				dismiss()
			} label: {
				HStack(spacing: 5) {
					Text("Already have an account?")
					Text("Sign in")
						.fontWeight(.bold)
				}
			}
			
		}
		.onAppear {
			viewModel.setMainViewViewModel(mainViewViewModel: mainViewViewModel)
		}
		
	}
}

struct RegisterView_Previews: PreviewProvider {
	static var previews: some View {
		RegisterView()
	}
}
