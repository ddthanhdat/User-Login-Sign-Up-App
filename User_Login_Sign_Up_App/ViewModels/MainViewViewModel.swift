//
//  MainViewViewModel.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
	@Published var user: User? = nil
	@Published var isLoading: Bool = false
	private var authUserManager = AuthUserManager()
	
	init() {
		setLoading(true)
		Task {
			let a = try await authUserManager.fetchCurrentUser()
			if let user = a {
				self.setUser(user: user)
			}
			setLoading(false)
		}
	}
	
	func setUser(user: User?) {
		DispatchQueue.main.async {
			self.user = user
		}
	}
	
	func setLoading(_ isLoading: Bool = false) {
		DispatchQueue.main.async {
			self.isLoading = isLoading
		}
	}
}
