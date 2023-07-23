//
//  RegisterViewViewModel.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import Foundation


class RegisterViewViewModel: ObservableObject {
	@Published var email: String = ""
	@Published var fullname: String = ""
	@Published var password: String = ""
	@Published var confirmPassword: String = ""
	private var mainViewViewModel: MainViewViewModel?
	
	private var authUserManager = AuthUserManager()
	
	
	func setMainViewViewModel(mainViewViewModel: MainViewViewModel?) {
		self.mainViewViewModel = mainViewViewModel
	}
	
	func signUp() {
		mainViewViewModel?.setLoading(true)
		Task {
			let user = try await authUserManager.createUser(email: email, fullname: fullname, password: password)
			mainViewViewModel?.setUser(user: user)
			mainViewViewModel?.setLoading(false)
		}
	}
	
	
	func isValidConfirmPassword() -> Bool {
		return password == confirmPassword
	}
	
	var isValidForm: Bool {
		return !email.isEmpty && email.contains("@") && password.count > 5 && password == confirmPassword
	}
}
