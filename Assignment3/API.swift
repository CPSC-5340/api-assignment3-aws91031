//
//  API.swift
//  Assignment3
//
//  Created by user250993 on 3/28/24.
//

import Foundation

struct APIService {
    
    func fetchLocations(accessToken: String) async throws -> StoreData {
        guard let url = URL(string: "https://api.kroger.com/v1/locations?filter.limit=25") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            let result = try JSONDecoder().decode(StoreData.self, from: data)
            print(result)
        } catch {
            print(error)
        }
        
        let response = try JSONDecoder().decode(StoreData.self, from: data)
        return response
    }
    
    func getAccessToken() async throws -> TokenResponse {
        let authString = "\(StaticValues.CLIENT_ID):\(StaticValues.CLIENT_SECRET)"
        let authData = authString.data(using: .utf8)
        let authValue = "Basic \(authData?.base64EncodedString() ?? "")"
        
        guard let url = URL(string: "https://api.kroger.com/v1/connect/oauth2/token") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "grant_type=client_credentials".data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(authValue, forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
        print("token \(tokenResponse.accessToken)")
        return tokenResponse
    }
    
}
