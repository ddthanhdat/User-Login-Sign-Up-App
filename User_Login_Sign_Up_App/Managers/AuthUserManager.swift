//
//  AuthUserManager.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class AuthUserManager {
	
	init() {
		
	}
	
	func signin(email: String, password: String) async throws -> User? {
		do {
			let a = try await Auth.auth().signIn(withEmail: email, password: password)
			return try await fetchUser(id: a.user.uid)
		} catch {
			
		}
		return nil
	}
	
	func createUser(email: String, fullname: String, password: String) async throws -> User? {
		do {
			let result = try await Auth.auth().createUser(withEmail: email, password: password)
			let user = User(id: result.user.uid, fullname: fullname, email: email)
			let encoderUser = try Firestore.Encoder().encode(user)
			try await Firestore.firestore().collection("users").document(user.id).setData(encoderUser)
			return user
		} catch {
			print("Error createuser")
		}
		return nil
	}
	
	func signout() async throws {
		try Auth.auth().signOut()
	}
	
	
	func deleteAccount() {
		guard let id = Auth.auth().currentUser?.uid else {
			return
		}
		Firestore.firestore().collection("users").document(id).delete()
	}
	
	func fetchUser(id: String) async throws -> User? {
		guard let snapshot = try? await Firestore.firestore().collection("users").document(id).getDocument() else { return nil }
		guard let user = try? snapshot.data(as: User.self) else { return nil }
		return user
	}
	
	func fetchCurrentUser() async throws -> User? {
		guard let id = Auth.auth().currentUser?.uid else { return nil }
		guard let snapshot = try? await Firestore.firestore().collection("users").document(id).getDocument() else { return nil }
		guard let user = try? snapshot.data(as: User.self) else { return nil }
		return user
	}

}
