import SwiftUI

struct FancyLoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false
    @State private var isGuestLogin = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.3)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    // Logo
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 50)
                    
                    Text("“Manage your money, master your life.”")
                        .font(.title3)
                        .italic()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    
                    // Email Input
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        .padding(.horizontal, 40)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    // Password Input
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        .padding(.horizontal, 40)
                    
                    // Login Button (Navigates to Dashboard)
                    NavigationLink(destination: DashboardView(), isActive: $isLoggedIn) {
                        Button(action: {
                            // Logic to authenticate user
                            print("Logging in with email: \(email)")
                            isLoggedIn = true // Set to true to navigate to dashboard after login
                        }) {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
                                .cornerRadius(25)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                        }
                    }
                    .padding(.top, 20)
                    
                    // Guest Login Button (Navigates to Dashboard as Guest)
                    NavigationLink(destination: DashboardView(), isActive: $isGuestLogin) {
                        Button(action: {
                            print("Logging in as guest...")
                            isGuestLogin = true // Navigate to dashboard as guest
                        }) {
                            Text("Continue as Guest")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color.gray)
                                .cornerRadius(25)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                        }
                    }
                    .padding(.top, 10)
                    
                    // Forgot Password Link
                    Button(action: {
                        // Show forgot password screen (not implemented yet)
                    }) {
                        Text("Forgot Password?")
                            .foregroundColor(.black)
                            .underline()
                    }
                    .padding(.top, 10)
                    
                    // Register Link for New Users
                    Button(action: {
                        // Show registration screen (not implemented yet)
                    }) {
                        Text("Don't have an account? Register")
                            .foregroundColor(.black)
                            .underline()
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Create an Account")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Enter your email", text: $email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            SecureField("Enter your password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            SecureField("Confirm your password", text: $confirmPassword)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            Button(action: {
                // Logic to handle registration
                if password == confirmPassword {
                    print("Registering with email: \(email)")
                } else {
                    print("Passwords do not match")
                }
            }) {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
}


struct ForgotPasswordView: View {
    @State private var email: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Reset Your Password")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Enter your email", text: $email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            Button(action: {
                // Logic to handle password reset
                print("Password reset request for email: \(email)")
            }) {
                Text("Reset Password")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
}


struct FancyLoginView_Previews: PreviewProvider {
    static var previews: some View {
        FancyLoginView()
    }
}


