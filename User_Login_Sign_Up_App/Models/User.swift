//
//  User.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import Foundation

struct User: Identifiable, Codable {
	let id: String
	let fullname: String
	let email:String
	
	var initials: String {
		let formatter = PersonNameComponentsFormatter()
		if let components = formatter.personNameComponents(from: fullname) {
			formatter.style = .abbreviated
			return formatter.string(from: components)
		}
		
		return ""
	}
}




extension User {
	static var MOOKUP = User(id: NSUUID().uuidString, fullname: "Do Thanh Dat", email: "ddthanhdat@gmai.com")
}
