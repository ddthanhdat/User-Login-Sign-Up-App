//
//  LoginView.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import SwiftUI

struct LoginView: View {
	@EnvironmentObject var mainViewModel: MainViewViewModel
	@StateObject var viewModel: LoginViewViewModel = LoginViewViewModel()
	
	init() {
	}
	
	var body: some View {
		NavigationStack {
			VStack {
				//Image
				Image("firebase_logo")
					.resizable()
					.scaledToFit()
					.frame(width: 100, height: 100)
					.padding(.vertical, 30)
				
				// Fields
				VStack(spacing: 10) {
					InputView(text: $viewModel.email, title: "Email address:", placeholder: "abc@email.com", isSecureField: false)
						.autocapitalization(.none)
					InputView(text: $viewModel.password, title: "Password:", placeholder: "enter your password", isSecureField: true)
				}
				.padding(.horizontal)
				.padding(.top, 12)
				
				
				// button Sign in
				Button {
					viewModel.login()
				} label: {
					HStack {
						Text("SIGN IN")
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
				NavigationLink {
					RegisterView()
						.navigationBarBackButtonHidden(true)
				} label: {
					HStack(spacing: 5) {
						Text("Don't have an account?")
						Text("Sign up")
							.fontWeight(.bold)
					}
				}
				
			}
		}.onAppear {
			viewModel.setMainViewViewModel(mainViewViewModel: mainViewModel)
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
