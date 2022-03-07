//
//  GamesView.swift
//  GameStream
//
//  Created by Antonio Paz on 16/02/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    //esto es para que se comunique con la vista modelo y almacena la informacion.
    @ObservedObject var todosLosVideoJuegos = ViewModel()
   // creamos esta variable para ir al videojuego correspondiente
    @State var gameViewIsActive: Bool = false
    
    //vamos a crear variables para guardar la informacion correspondiente.
    
    @State var url:String = ""
    @State var titulo:String = ""
    @State var estudio:String = ""
    @State var calificacion:String = ""
    @State var añoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgUrls:[String] = [""]
    
    let formaGrid = [
    
        GridItem(.flexible()),
        GridItem(.flexible())
    
    
    ]
    
    
    
    var body: some View {
        
        
        
        
        
        
        
        
        ZStack(alignment: .top) {
                Color("blue-hiden")
                .ignoresSafeArea()
            
            
            VStack{
                
                Text("Juegos")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                
                ScrollView{
                    LazyVGrid(columns: formaGrid, spacing: 8){
                        
                        ForEach(todosLosVideoJuegos.gamesInfo, id: \.self){
                            
                            
                            juego in
                            
                            Button(action: {
                                
                                //mobile por que es una app para iphone
                                
                                //las variables del state seran igual a las que tenemos en el modelo
                                
                                url = juego.videosUrls.mobile
                                titulo = juego.title
                                estudio = juego.studio
                                calificacion = juego.contentRaiting
                                añoPublicacion = juego.publicationYear
                                descripcion = juego.description
                                tags = juego.tags
                                imgUrls = juego.galleryImages
                                
                                
                                gameViewIsActive = true
                                
                            }, label: {
                                
                                KFImage(URL(string: juego.galleryImages[0])!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle.init(cornerRadius: 4))
                                    .padding(.bottom, 12)
                            })
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
            }.padding(.horizontal, 6.0)
            
            
            //esto estará pasando los datos de una pantalla a otra
            
            NavigationLink(destination: GameView(url: url, titulo: titulo, estudio: estudio, calificacion: calificacion, añoPublicacion: añoPublicacion, descripcion: descripcion, tags: tags, imgUrls: imgUrls), isActive: $gameViewIsActive, label: {
                
                EmptyView()
            })
            
              
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).onAppear {
               
                
                
        }
        
        
        
        
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}



/*
 
 Vamos a utilizar una lazygrid es una malla y solo se utiliza en memoria cuando se muestra al usuario esto es muy util por que nos sabemos cuantas imagenes nos va a devolver el servidor.
 
 Y si no tenemos cuidado esto puede consumir mucha memoria.
 
 creamos estas variables por que tenemos que pasar la info de la variable todos los juegos a sus variables correspondientes.
 
 
 actualmente no tenemos algo que nos muestre la vista de imagen con una url es por eso que vamos a utilizar una libreria de terceros de la comunidad
 
 
 
 */
