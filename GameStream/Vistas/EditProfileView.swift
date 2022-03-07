//
//  EditProfileView.swift
//  GameStream
//
//  Created by Antonio Paz on 3/03/22.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var imagenPerfil:Image? = Image("foto-perfil")
    
    @State var isCameraActive = false
    
    
    var body: some View {
        
        
        
        
        
        
        
        
        ZStack {
            Color("blue-hiden")
                .ignoresSafeArea()
            
            
            ScrollView {
                
                
                
                
                VStack {
                    
                    Text("Editar Perfil")
                        .foregroundColor(.white)
                    
                    
                    Button(action: {  isCameraActive = true   }) {
                        
                        ZStack {
                            imagenPerfil!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                                .sheet(isPresented: $isCameraActive) {
                                    
                                    SUImagePickerView(sourceType: .photoLibrary, image: self.$imagenPerfil, isPresented: $isCameraActive)
                                    
                                    
                                }
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                
                    
                }.padding(.bottom, 18.0)
                
                ModuloEditar()
                
                
            }
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
    }
}


struct ModuloEditar:View{
    
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var nombreUsuario:String = ""
    
    
    
    var body: some View{
        
        
        VStack(alignment: .leading) {
            
            Text("Correo Electrónico")
                .foregroundColor(Color("dark-cian"))
            
            ZStack(alignment: .leading){
                
                if correo.isEmpty{
                    
                    Text(verbatim: "correo@gmail.com")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    
                }
                
                TextField("", text: $correo).foregroundColor(.white)
                
                
            }
            
            Divider()
                .frame(height: 1.0)
                .background(Color("dark-cian"))
                .padding(.bottom)
                
            
      //------------------->
            Text("Contraseña")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading){
                
                if contraseña.isEmpty{
                    
                    Text(verbatim: "Introduce tu contraseña")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    
                }
                
                SecureField("", text: $contraseña)
                    .foregroundColor(.white)
                
                
            }
            
            Divider()
                .frame(height: 1.0)
                .background(Color("dark-cian"))
                .padding(.bottom)
            
         
            //------------------->
            Text("Nombre")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading){
                
                if nombreUsuario.isEmpty{
                    
                    Text(verbatim: "Introduce tu nombre usuario")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    
                }
                
                TextField("", text: $nombreUsuario)
                    .foregroundColor(.white)
                
                
            }
            
            Divider()
                .frame(height: 1.0)
                .background(Color("dark-cian"))
                .padding(.bottom, 32)
            
            
            Button(action:{ actualizarDatos()}, label: {
                Text("ACTUALIZAR DATOS")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,  alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0)
                    .stroke(Color("dark-cian"), lineWidth: 1.0)
                    .shadow(color: .white, radius: 3.0))
                
                
                
            }).padding(.bottom)
            
            
            
            
        }.padding(.horizontal, 42.0)
        
        
    }
    
    
    func actualizarDatos(){
        
        let objetoActualizador = SaveData()

        let resultado = objetoActualizador.guardarDatos(correo: correo, contraseña: contraseña, nombre: nombreUsuario)
        
        
        
        print("se guardaron los datos? \(resultado)")
        
        
    }
    
    
    
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
