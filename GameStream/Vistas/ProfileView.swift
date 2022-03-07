//
//  ProfileView.swift
//  GameStream
//
//  Created by Antonio Paz on 24/02/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuario = "lorem"
    
    @State var imagenPerfil:UIImage = UIImage(named: "foto-perfil")!
    
    
    
    var body: some View {
        
        
        
        ZStack {
            Color("blue-hiden")
                .ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            
            
            
            VStack {
                Text("Perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center).padding()
                
                VStack{
                    
                    Image(uiImage: imagenPerfil)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118.0, height: 118.0)
                        .clipShape(Circle())
                    
                    Text(nombreUsuario)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                
                Text("AJUSTES")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading).padding(.leading, 18)
                
                
                ModuloAjustes()
                
                Spacer()
                
            }
            
            
            
            //aqui recuperamos la informacion del usuario.
        }.onAppear(
            perform: {
                
                
                
                //metodo de recuperacion de la imagen
                
                if ReturnUiImage(named: "fotoperfil") != nil {
                    
                    imagenPerfil = ReturnUiImage(named: "fotoperfil")!
                    
                }else{
                    
                    print("No encontre ninguna foto de perfil ")
                    
                    
                }
                
                
                
                
                
                
                print("revisando si tengo datos de usuario en mi userDefaults")
                
                
                if UserDefaults.standard.object(forKey: "datosUsuario") != nil{
                    
                    nombreUsuario = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
                    
                }else{
                    
                    print("no encontre informacion del usuario")
                    
                }
                
                
                
                
            })
        
        
        
        
    }
    
    
    
    
    
    
    func ReturnUiImage(named: String) -> UIImage? {
        
        
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            
            
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
            
            
            
            
        }
           
            return nil
            
            
            
        
        
        
        
    }
}

struct ModuloAjustes:View{
    
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    
    var body: some View{
        
        
        VStack(spacing: 3.0) {
            
            Button(action: { }) {
                
                
                
                
                HStack {
                    
                    Text("Cuenta")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    Spacer()
                    
                    Text(">")
                        .foregroundColor(.white)
                        .font(.subheadline)
                
                }
                .padding()
                .background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding(.horizontal, 8.0)
                
                
                
                
                
                
            }
            
            Button(action: { }) {
                
                
                
                
                HStack {
                    
                    Text("Notificaciones")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    Spacer()
                    
                 Toggle("", isOn: $isToggleOn)
                
                
                }
                .padding()
                .background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding(.horizontal, 8.0)
                
                
                
                
                
                
            }
            
            Button(action: { isEditProfileViewActive = true }) {
                
                
                
                
                HStack {
                    
                    Text("Editar Perfil")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    Spacer()
                    
                    Text(">")
                        .foregroundColor(.white)
                        .font(.subheadline)
                
                }
                .padding()
                .background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding(.horizontal, 8.0)
                
                
                
                
                
                
            }
            
            Button(action: { }) {
                
                
                
                
                HStack {
                    
                    Text("Califica esta applicación")
                        .foregroundColor(.white)
                        .font(.subheadline)
               
                    Spacer()
                    
                    Text(">")
                        .foregroundColor(.white)
                        .font(.subheadline)
                
                }
                .padding()
           
                
                
                
            } .background(Color("blue-gray"))
              .clipShape(RoundedRectangle(cornerRadius: 10.0))
              .padding(.horizontal, 8.0)
                
                
                NavigationLink(
                    destination: EditProfileView(),
                    isActive: $isEditProfileViewActive) {
                        EmptyView()
                    }
            
        }
        
        
    }
    
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
