//
//  SupabaseManager.swift
//  SupabaseManager
//
//  Created by Hardik Modha on 04/05/25.
//

import Foundation
import Supabase

public actor SupabaseManager {
    
    public static let shared = SupabaseManager()
    
    //MARK: - Private Properties
    private var client: SupabaseClient?
    
    public static func configure(withURL supabaseURL: URL, andKey supabaseKey: String) async {
        await shared.setup(withURL: supabaseURL, andKey: supabaseKey)
    }
    
    private func setup(withURL supabaseURL: URL, andKey supabaseKey: String) async {
        self.client = SupabaseClient(supabaseURL: supabaseURL, supabaseKey: supabaseKey)
    }
    
    public func getClient() -> SupabaseClient? {
        guard let client = self.client else { return nil }
        return client
    }
    
}
