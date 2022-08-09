//
//  LoginView.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 2.08.2022.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    
    var body: some View {
       
            if viewModel.signedIn{
                ContentView()
                    .preferredColorScheme(.light)
                    .environmentObject(viewModel)
            }
            else{
                Home()
                    .preferredColorScheme(.dark)
                    .environmentObject(viewModel)
            }
            
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct Home: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @State var index = 0
    
    var body: some View{
        
        GeometryReader{_ in
            
            VStack {
                
                Image("pokemon")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                
                ZStack {
                    
                    SignUP(index: self.$index)
                        // changing view order...
                        .zIndex(Double(self.index))
                    
                    Login(index: self.$index)
                    
                }
                .padding(.bottom,30)
                
                
                
                

                NavigationLink {
                    PokedexView()
                } label: {
                    Text("INFO")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                        .background(Color("Color1"))
                        .clipShape(Capsule())
                        // shadow...
                        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                }
                


                
                HStack(spacing: 15) {
                    
                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)
                    
                    Text("OR")
                    
                    
                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                // because login button is moved 25 in y axis and 25 padding = 50
                
                HStack(spacing: 25) {
                    
                    Button {
                        
                    } label: {
                        
                        Image("apple")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 43, height: 43)
                            
                        
                    }
                    
                    Button {
                        
                    } label: {
                        
                        Image("facebook")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 43, height: 43)
                            .clipShape(Circle())
                        
                    }
                    
                    Button {
                        
                    } label: {
                        
                        Image("twitter")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 43, height: 43)
                            
                        
                    }

                    
                }
                .padding(.top, 15)
                
                
            }
            .padding(.vertical)
            
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
        
        
    }
}


//Curve...

struct CShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            //right side curve...
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
    
}

struct CShape1: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            //left side curve...
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
    
}

struct Login: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    @State var email = ""
    @State var password = ""
    @Binding var index : Int
    
    @State var showAlert = false
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            VStack {
                
                HStack{
                    
                    VStack(spacing: 10) {
                        
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                        
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 30) // for top curve..
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        
                        TextField("Email Address", text: self.$email)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        SecureField("Password", text: self.$password)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack {
                    
                    Spacer(minLength: 0)
                    
                    

                }
                .padding(.horizontal)
                .padding(.top, 50)
            }
            .padding()
            // bottom padding...
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                
                self.index = 0
                
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            //Button...
            
            Button {
                appViewModel.signIn(email: email, password: password)
                //ALERT CONDITION
                
                if appViewModel.success == false && appViewModel.errorMessage != "" {
                    showAlert.toggle()
                }
                
                
            } label: {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    // shadow...
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            
            // moving view down..
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(appViewModel.errorMessage), dismissButton: .destructive(Text("OK")))
            }
        }
        
    }
}


// SignUP Page...


struct SignUP: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    @State var showAlert = false
    @State var email = ""
    @State var password = ""
    @State var Repassword = ""
    @Binding var index : Int
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            VStack {
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10) {
                        
                        Text("SignUP")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    
           
                }
                .padding(.top, 30) // for top curve..
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        
                        TextField("Email Address", text: self.$email)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        SecureField("Password", text: self.$password)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                

                // Replacing forget password with reenter password
                // so same height will be maintained...
                
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        SecureField("Re-enter Password", text: self.$Repassword)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            // bottom padding...
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShape1())
            // clipping the content shape also for tap gesture...
            .contentShape(CShape1())
            // shadow...
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                
                self.index = 1
                
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            //Button...
            
            Button {
                
                if !password.isEmpty && password == Repassword && email.isValidEmail == true {
                    appViewModel.signUp(email: email, password: password)
                }
                else{
                    showAlert.toggle()
                }
                
                
                
            } label: {
                
                
                Text("SIGN UP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    // shadow...
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            
            // moving view down..
            .offset(y: 25)
            
            // hiding view when its in background...
            // only button...
            .opacity(self.index == 1 ? 1 : 0)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(email.isValidEmail ? "Passwords does not match!" : "Email is badly formatted"), dismissButton: .destructive(Text("OK")))
            }

            
        }
        
    }
}


extension String {

  var isValidEmail: Bool {
    let name = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
    let domain = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
    let emailRegEx = name + "@" + domain + "[A-Za-z]{2,8}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    return emailPredicate.evaluate(with: self)
  }

}
