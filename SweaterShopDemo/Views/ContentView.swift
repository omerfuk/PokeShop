//
//  ContentView.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @StateObject var cartManager = CartManager()
    @State var search = ""
    
    var columns = [GridItem(.adaptive(minimum: 140), spacing: 20)]
 
    /*
     To change navigation bar appearance
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
     
    */
    var body: some View {
        
        ZStack{
            Color("Color1").opacity(0.25).ignoresSafeArea()
            
            ScrollView{
                
                LazyVGrid(columns: columns,spacing: 20) {
                    ForEach(search.isEmpty ? cartManager.items : cartManager.filtered) { item in
                        
                        NavigationLink {
                            ItemDetailView(item: item)
                                .environmentObject(cartManager)
                        } label: {
                            ProductCard(item: item, showAlert: false)
                                .environmentObject(cartManager)
                        }
                    }
                }
                .padding()
                
            }
            .searchable(text: $search)
            .onChange(of: search, perform: { searchValue in
                withAnimation {
                    cartManager.filtered = cartManager.items.filter({ item in
                        item.item_title.lowercased().contains(search.lowercased())
                    })
                }
            })
            .onAppear{
                
                cartManager.fetchData()
            }
            .navigationTitle("Sweater Shop")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        CartView(showAlert: false)
                            .environmentObject(cartManager)
                    } label: {
                        CartButton(numberOfProducts: cartManager.itemsOnCart.count)
                            .font(.title)
                            .foregroundColor(.pink)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation(.easeIn){viewModel.showMenu.toggle()}
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.pink)
                    }
                    
                }
                
                
            }
            HStack {
                Menu(viewModel: viewModel)
                //Move effect from left
                    .offset(x: viewModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                
                Spacer(minLength: 0)
                
            }
            .background(
                Color.black.opacity(viewModel.showMenu ? 0.3 : 0).ignoresSafeArea()
                //Closing when taps on outside...
                    .onTapGesture(perform: {
                        withAnimation(.easeIn){viewModel.showMenu.toggle()}
                    })
            )
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
