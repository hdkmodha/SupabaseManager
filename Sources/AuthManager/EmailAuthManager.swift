//
//  EmailAuthManager.swift
//  SupabaseManager
//
//  Created by Hardik Modha on 04/05/25.
//

import Foundation
import Supabase
import SupabaseManager

enum EmailAuthError: Error {
    case clientNotFound
    case userNotFound
    
}

public actor EmailAuthManager {
    
    static let shared = EmailAuthManager()
    
    private var authResponse: AuthResponse?
    private var session: Session?
    
    
    private init() {}
    
    
    private func getClient() async -> SupabaseClient? {
        return await SupabaseManager.shared.getClient()
    }
    
    
    public func createUser(withEmail email: String, andPasswod password: String) async -> Bool {
        guard let client = await self.getClient() else { return  false }
        
        do {
            let authResponse = try await client.auth.signUp(email: email, password: password)
            print(authResponse.session)
            self.session = authResponse.session
            return true
        } catch {
            return false
        }
    }
    
    public func login(withEmail email: String, andPassword password: String) async -> Bool {
        guard let client = await self.getClient() else { return  false }
        
        do {
            let session = try await client.auth.signIn(email: email, password: password)
            print(session)
            self.session = session
            return true
        } catch {
            return false
        }
    }
    
    public var user: User? {
        guard let session else { return nil }
        return session.user
    }
}
