//
//  ProfileView.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import SwiftUI

struct ProfileView: View {
	@EnvironmentObject var mainViewViewModel: MainViewViewModel
	private var authUserManager = AuthUserManager()
	var body: some View {
		List {
			Section {
				HStack(spacing: 20) {
					Text("DD")
						.font(.title)
						.fontWeight(.semibold)
						.foregroundColor(.white)
						.frame(width: 72, height: 72)
						.background(Color(.systemGray3))
						.cornerRadius(100)
					
					VStack(alignment: .leading, spacing: 5) {
						Text(mainViewViewModel.user?.fullname ?? "")
							.fontWeight(.semibold)
						
						Text(mainViewViewModel.user?.email ?? "")
							.font(.footnote)
							.accentColor(.gray)
					}
				}
			}
			
			Section("General") {
				HStack {
					SettingRowView(imageName: "gear", title: "Version", tinColor: Color(.systemGray))
					Spacer()
					Text("1.0.0")
						.font(.subheadline)
						.foregroundColor(.gray)
				}
			}
			
			Section("Account") {
				Button {
					Task {
						try await authUserManager.signout()
					}
					mainViewViewModel.setUser(user: nil)
				} label: {
					SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tinColor: .red)
				}
				Button {
					
				} label: {
					SettingRowView(imageName: "xmark.circle.fill", title: "Delete account", tinColor: .red)
				}
				
			}
		}
	}
}

struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileView()
	}
}
