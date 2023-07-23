//
//  LoginViewViewModel.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import Foundation



class LoginViewViewModel: ObservableObject {
	@Published var email: String = ""
	@Published var password: String = ""
	private var mainViewModel: MainViewViewModel?
	
	var authUserManager = AuthUserManager()
	
	init() {
	}
	
	func setMainViewViewModel(mainViewViewModel: MainViewViewModel?) {
		self.mainViewModel = mainViewViewModel
	}
	
	func login() {
		mainViewModel?.setLoading(true)
		Task {
			let user = try await authUserManager.signin(email: email, password: password)
			mainViewModel?.setUser(user: user ?? nil)
			mainViewModel?.setLoading(false)
		}
	}
	
	var isValidForm: Bool {
		return !email.isEmpty && email.contains("@") && !password.isEmpty
	}
}
