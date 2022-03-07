//
//  ContentView.swift
//  GameStream
//
//  Created by Antonio Paz on 6/02/22.
//

import SwiftUI
//------------------> esta es la estructura principal
struct ContentView: View {
    var body: some View {
        
        
        NavigationView{
            
            ZStack {
                
                Spacer()
                
                //lo podemos dividir entre 255 para no escribir un double.
                Color("blue-hiden")
                    .ignoresSafeArea()
                
                //creamos un vstack por que tenemos mas elementos no solo la imagen.
                VStack{
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom, 35)
                    
                    
                    InicioYRegistroView()
                    
                    
                }
                
                
                
                
                
                
                
                
                
            }.navigationBarHidden(true)
            
            
            
        }
       
        
        
        
        
        
        
    }
}

//-----------------------> esta es la vista con la logica de registro
struct InicioYRegistroView:View{
    
    @State var tipoInicioSesion:Bool = true

    
    var body: some View{
        
        
        
        
        
        VStack{
            
            HStack {
                
                Spacer()
                
                Button("INICIO SESIÓN") {
                    tipoInicioSesion = true
                    
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                //estamos utilizando un operador terneario para cambiar el colo
                Spacer()
                
                Button("REGÍSTRATE") {
                    tipoInicioSesion = false
                   
                }
                .foregroundColor(tipoInicioSesion ? .gray : .white)
                //estamos utilizando un operador terneario para cambiar el colo
                
                Spacer()
                
                
            }
            
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true{
                
                InicioSesionView()
                
                
            }else{
                
                RegistroView()
                
            }
            
            
            
            
        }
    }
    
}



//-------------> vista para inciar session
struct InicioSesionView:View{
    
    @State var correo = ""
    @State var contraseña = ""
    @State var isPantallaHomeActive = false
    @State var fallaUsuario = false
    
    var body: some View{
        
        
        
        
        
        ScrollView(){
            
            
            
            
            VStack(alignment: .leading) {
                
                
                //---------------> parte correo
                Text("Correo Electrónico")
                    .foregroundColor(Color("dark-cian"))
                
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty{
                        
                        Text("ejemplo@gmail_com")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                    }
                    
                    TextField("", text: $correo)
                        .foregroundColor(.white)
                    
                    
                    
                }
                
                Divider().frame(height: 1)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
                
                //---------------> parte de contraseña
                Text("Contraseña").foregroundColor(.white)
                ZStack(alignment: .leading){
                    
                    if contraseña.isEmpty{
                        
                        Text("Escribe tu contraseña")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                    }
                    
                    SecureField("", text: $contraseña)
                        .foregroundColor(.white)
                    
                    
                    
                }
                
                Divider().frame(height: 1).background(Color("dark-cian"))
                    .padding(.bottom)
                
                
                Text("¿Olvidaste tu contraseña?")
                    .foregroundColor(Color("dark-cian"))
                    .font(.footnote).frame(width: 300, alignment: .trailing)
                    .padding(.bottom, 37)
                
                //----------> parte de los botones
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,  alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                        .stroke(Color("dark-cian"), lineWidth: 1.0)
                        .shadow(color: .white, radius: 6.0))
                }).alert(isPresented: $fallaUsuario) {
                    Alert(title: Text("Error"), message: Text("Correo o contraseña incorrecta vuleva a intentarlo por favor"), dismissButton: .default(Text("Entendido")))
                }
                
                Text("Inicia sesión con redes sociales")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 70)
                
                
                
                HStack{
                    
                    
                    Button(action: {print("pulse el boton de facebook")}) {
                        
                        
                        Text("Facebook")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color("blue-gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        
                        
                    }.padding()
                    
                    
                    
                    Button(action: {print("pulse el boton de facebook")}) {
                        
                        
                        Text("Twitter")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color("blue-gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        
                        
                    }.padding()
                    
                    
                }.frame(width: 300)
                
                
        
              
                
            }.padding(.horizontal,77.0)
            
            NavigationLink(destination: Home(),
                           isActive: $isPantallaHomeActive) {
                            EmptyView()
            }
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    //metodos de iniciar sesión

    func iniciarSesion(){
        
        
        let objetoActualizador = SaveData()
        
        let resultado = objetoActualizador.validar(correo: self.correo, contraseña: self.contraseña)
        
        
        if resultado == true{
            
            fallaUsuario = false
            isPantallaHomeActive = true
            
            
        }else{
            
            fallaUsuario = true
            
            
        }
        
       
        
        
    }
    
    
    
}



// --------------> vista para registrase
struct RegistroView:View{
    
    
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var confirmarContraseña:String = ""
    @State var contraseñaNoConfirmada = false
    @State var isPantallaHomeActive = false
    
    
    var body: some View{
        
        
        
        ScrollView(){
            
            
            
            VStack(alignment: .center){
                
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    
                Text("Puedes cambiar o elegirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: tomarFoto) {
                    
                    
                    
                    ZStack{
                        
                        
                        Image("foto-perfil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
            }.padding(.bottom)
            
            
            
            VStack{

                VStack(alignment: .leading){
                //---------------> parte correo
                    Text("Correo Electrónico*")
                        .foregroundColor(Color("dark-cian"))
                        .frame(width: 300, alignment: .leading)

                        
                ZStack(alignment: .leading){

                    if correo.isEmpty{

                        Text("ejemplo@gmail_com")
                            .foregroundColor(.gray)
                            .font(.caption)

                    }

                    TextField("", text: $correo)
                        .foregroundColor(.white)



                }

                Divider().frame(height: 1)
                        .background(Color("dark-cian"))
                        .padding(.bottom)


                //---------------> parte de contraseña
                Text("Contraseña*")
                        .foregroundColor(.white)
                    
                    
                    
                ZStack(alignment: .leading){

                    if contraseña.isEmpty{

                        Text("Escribe tu contraseña")
                            .foregroundColor(.gray)
                            .font(.caption)

                    }

                    SecureField("", text: $contraseña)
                        .foregroundColor(.white)



                }

                    Divider().frame(height: 1)
                        .background(.white)
                        .padding(.bottom)


               //-----------> confirmar contraseña
                
                Text("Confirmar Contraseña*").foregroundColor(.white)
                    
                    
                    
                ZStack(alignment: .leading){

                    if confirmarContraseña.isEmpty{

                        Text("Escribe tu contraseña")
                            .foregroundColor(.gray)
                            .font(.caption)

                    }

                    SecureField("", text: $confirmarContraseña).foregroundColor(.white)



                }

                    Divider().frame(height: 1)
                        .background(.white)
                        .padding(.bottom)

                
            }

                //----------> parte de los botones
                Button(action: registrate, label: {
                    Text("REGÍSTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,  alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: .white, radius: 6.0))
                }).alert(isPresented: $contraseñaNoConfirmada) {
                    Alert(title: Text("Error"), message: Text("Las contraseñas no coinciden vuelva a intentarlo por favor"), dismissButton: .default(Text("Entendido")))
                }
                
                NavigationLink(destination: Home(), isActive: $isPantallaHomeActive, label: {EmptyView()})

                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 10)
                
                
                
                

                HStack{
                    
                    
                    
                    Button(action: {print("pulse el boton de facebook")}) {
                        
                        
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("blue-gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        
                    }.padding()

                   

                    Button(action: {print("pulse el boton de facebook")}) {
                        
                        
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("blue-gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        
                    }.padding()


                }.frame(width: 300)





            }.padding(.horizontal,77.0)

           
            
            
        }
        
       
        
        }
    
    func registrate() {
        
        
        
        
    
        //validando la contraseña
        if contraseña != confirmarContraseña{
    
            contraseñaNoConfirmada = true
            
        }else{
            
            contraseñaNoConfirmada = false
            
            
        }
        
        let objetoActualizador = SaveData()
        let resultado = objetoActualizador.registrar(correo: correo, contraseña: contraseña)
    
        
        isPantallaHomeActive = true
        print("se guardo la informacion: \(resultado)")
      
        
     
        
       
        
            
            
        }
        
        
        
    
        
        
        
        
        
    }
    
    
    


func tomarFoto(){
    print("voy a tomar una foto")
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
