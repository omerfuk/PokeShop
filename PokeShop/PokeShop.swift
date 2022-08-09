//
//  SweaterShopDemoApp.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 31.07.2022.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
      FirebaseApp.configure()
    return true
  }
}


@main
struct PokeShop: App {
    @StateObject var pokemonViewModel = PokemonViewModel()
    @StateObject var appViewModel = AppViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView{
                
                ContentView()
                    .environmentObject(appViewModel)
                    .environmentObject(pokemonViewModel)
            }
            .accentColor(Color("Color1").opacity(0.8))
            
        }
    }
}
