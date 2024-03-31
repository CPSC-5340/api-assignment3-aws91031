//
//  AuthViewModel.swift
//  Assignment3
//
//  Created by user250993 on 3/30/24.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var accessToken: String?
    @Published var error: Error?
    private let apiService = APIService()
    
    func getAccessToken() async {
        do {
            let tokenResponse = try await apiService.getAccessToken()
            self.accessToken = tokenResponse.accessToken
            self.error = nil
        } catch {
            self.accessToken = nil
            self.error = error
        }
    }
}
