//
//  MainView.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import SwiftUI

struct MainView: View {
	@StateObject var viewModel = MainViewViewModel()
	
    var body: some View {
		ZStack {
			if viewModel.user != nil {
				ProfileView()
			} else {
				LoginView()
			}
			
			if viewModel.isLoading {
				ZStack {
					Color(.systemBackground)
						.ignoresSafeArea()
						.opacity(0.7)
					ProgressView()
						.progressViewStyle(CircularProgressViewStyle(tint: .blue))
						.scaleEffect(3)
				}
			}
		}
		.environmentObject(viewModel)
		
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
