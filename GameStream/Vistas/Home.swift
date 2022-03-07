//
//  Home.swift
//  GameStream
//
//  Created by Antonio Paz on 11/02/22.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var tabSelecionado: Int = 2
    
    
    var body: some View {
        
        
        TabView(selection: $tabSelecionado){
            
            
            
            
                ProfileView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            
                GamesView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            
                PantallaHome()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
                FavoritosView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
            
            
            
            
        }.accentColor(.white)
        
        
        
        
        
        
    }
    
    
    init(){
            
            UITabBar.appearance().backgroundColor = UIColor(Color("tabBarColor"))
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
            UITabBar.appearance().isTranslucent = true
            
        }
}



struct PantallaHome: View{
    
  
    
    var body: some View{
        
        ZStack(alignment: .leading) {
            
            Color("blue-hiden").ignoresSafeArea()
            
            
            VStack {
                
                Image("AppLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250).padding(.vertical, 11.0)
                    .padding()
                
                
               
                
                
                ScrollView(showsIndicators: false){
                    SubModuloHome()
                    
                }
                            
                
            }.padding(.horizontal, 18)
               
                
            
        }.navigationBarHidden(true)
.navigationBarBackButtonHidden(true)
        
        
        
        
        
        
    }
    
    
    
    
//    func barraBusqueda() {
//
//        print("EL usuario esta buscando \(TextoBusqueda)")
//
//
//    }
}

//---------------> modulo para mostrar videos con logica de programacion
//esto es lo que nos muestra los videos por medio de las variables url
struct SubModuloHome:View {
    
    @State var isGameInfoEmpty = false
    //variable que busca
    @State var TextoBusqueda = ""
    
    //para guardar el juego que buscamos
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    
    @State var url:String = ""
    @State var titulo:String = ""
    @State var estudio:String = ""
    @State var calificacion:String = ""
    @State var añoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgUrls:[String] = [""]
    
    
    
    var body: some View{
        
        VStack {
            
            HStack{
                
                
                Button(action: {
                    
                    
                    
                    WatchGame(name: TextoBusqueda)
                    
                    
                    
                } , label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(TextoBusqueda.isEmpty ? Color(.yellow) : Color("dark-cian"))
                }).alert(isPresented: $isGameInfoEmpty) {
                    
                    
                    Alert(title: Text("ERROR"), message: Text("no se encontro el juego"), dismissButton: .default(Text("Entendido")))
                    
                
                }
                
                
                
                
                ZStack(alignment: .leading){
                    
                    if TextoBusqueda.isEmpty{
                        
                        Text("Buscar un video")
                            .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        
                    }
                    
                    TextField("", text: $TextoBusqueda)
                        .foregroundColor(.white)
                    
                    
                }
                
                
                
                
            }
            .padding([.top, .leading, .bottom], 11.0)
            .background(Color("blue-gray"))
            .clipShape(Capsule())
            
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack{
                
                Button(action: {
                    
                 WatchGame(name: "The Witcher 3")
                        
                }, label: {
                    
                    VStack(spacing: 0) {
                        
                        Image("wichet")
                            .resizable()
                            .scaledToFill()
                          
                        
                        Text("The Wicher 3")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("blue-gray"))
                        
                        
                    }
    
                    
                })
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
                
                
                
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
            
            
            Text("CATEGORÍAS SUGERIDAS PARA TI ")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding([.top, .bottom], 15)
                
            
            ScrollView(.horizontal, showsIndicators: false){
                
                
                HStack{
                    
                    Button(action: {print("estoy pulsando la categoria fps")}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 150, height: 90)
                            
                            Image("FPS")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                        
                    })
                    
                    Button(action: {print("estoy pulsando la categoria rpg")}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 150, height: 90)
                            
                            Image("rpg-icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                        
                    })
                    
                    
                    Button(action: {print("estoy pulsando la categoria mundo abierto")}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 150, height: 90)
                            
                            Image("mundoAbierto")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                        
                    })
                    
                    
                    
                    
                }
                
            }
            
            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding([.top, .bottom], 15)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                
                HStack{
                    
                    Button(action: {
                        
                      WatchGame(name: "Abzu")
                        
                    }, label: {
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 135)
                    })
                    
                    Button(action: {
                        
                        WatchGame(name: "Crash Bandicoot")
                        
                    }, label: {
                        Image("Crash Bandicoot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 135)
                    })
                    
                    
                    Button(action: {
                        
                      WatchGame(name: "DEATH STRANDING")
                        
                    }, label: {
                        Image("DEATH STRANDING")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 135)
                    })
                    
                    
                    
                }
                
                
                
            }
            
            
            Text("VIDEOS QUE TE PODRIAN GUSTAR")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding([.top, .bottom], 15)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                
                HStack{
                    
                    Button(action: {
                        
                        WatchGame(name: "Cuphead")
                        
                    }, label: {
                        Image("Cuphead")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 135)
                    })
                    
                    Button(action: {
                        
                        WatchGame(name: "Hades")
                        
                    }, label: {
                        Image("Hades")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 135)
                    })
                    
                    
                    Button(action: {
                        
                        WatchGame(name: "gtav")
                    }, label: {
                        Image("gtav")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 135)
                    })
                    
                    
                    
                }
                
                
                
            }
            
        }
        
        
        
        NavigationLink(destination: GameView(url: url, titulo: titulo, estudio: estudio, calificacion: calificacion, añoPublicacion: añoPublicacion, descripcion: descripcion, tags: tags, imgUrls: imgUrls), isActive: $isGameViewActive) {
            EmptyView()
        }
        
        
        
    }

    func WatchGame(name: String){
        
        juegoEncontrado.search(gameName: name)
        
        
        //estamos parando un hilo del prosesador despues del tiempo para que ejecute el codigo.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            
        
            print("cantidad elementos encontrados: \(juegoEncontrado.gameInfo.count)")
            
            
            if juegoEncontrado.gameInfo.count == 0 {
                
                isGameInfoEmpty = true
                
            }else{
                
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                estudio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                añoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgUrls = juegoEncontrado.gameInfo[0].galleryImages
                
                isGameViewActive = true
                
            }
            
            
        }
        
        
    }
    
    
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
