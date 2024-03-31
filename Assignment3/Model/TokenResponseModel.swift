//
//  TokenResponseModel.swift
//  Assignment3
//
//  Created by user250993 on 3/28/24.
//

import Foundation

struct TokenResponse: Codable {
    let accessToken: String
    let tokenType: String
    let expiresIn: Int

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
    }
}
