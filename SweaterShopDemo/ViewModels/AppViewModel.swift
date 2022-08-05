//
//  AppViewModel.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 2.08.2022.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    
    let auth = Auth.auth()
    @State var success = false
    @Published var signedIn = false
    @Published var errorMessage = ""
    
    
    var isSignedIn: Bool {
        
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            
            if error == nil {
                print("User Successfully logged in")
                //Success
                
                DispatchQueue.main.async {
                    self?.success = true
                    self?.signedIn = true
                }
                
            }
            else{
                DispatchQueue.main.async {
                    self?.success = false
                    print(error)
                    self?.errorMessage = error?.localizedDescription ?? "Error occured"
                }
                
                
            }
            
            
        }
        
    }
    
    func signUp(email: String, password: String) {
        
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            if error == nil {
                print("User Successfully created")
                return
            }
            
            
            //Success
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
        
        
    }
    
}
