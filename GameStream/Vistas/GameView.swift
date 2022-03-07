//
//  GameView.swift
//  GameStream
//
//  Created by Antonio Paz on 21/02/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
     var url:String
     var titulo:String
     var estudio:String
     var calificacion:String
     var añoPublicacion:String
     var descripcion:String
     var tags:[String]
     var imgUrls:[String]
    
    
    var body: some View {
        
        
        
        
        ZStack {
            Color("blue-hiden").ignoresSafeArea()
            
            
            
            VStack {
                
                Video(url: url).frame(height: 300)
                
                
                ScrollView{
                    
                    
                    VideoInfo(titulo: titulo, estudio: estudio, calificacion: calificacion, añoPublicacion: añoPublicacion, descripcion: descripcion, tags: tags).padding(.bottom)
                    
                    // esto es la para la galeria.c
                    Gallery(imgsUrls: imgUrls)
                    
                    Comments()
                    
                    similarGames()
                    
                }.frame(maxWidth: .infinity)
                
                
                
                
            }
            
            
            
            
        }
        
        
        
        
        
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo", titulo: "god of war", estudio: "santa monica", calificacion: "E+", añoPublicacion: "2018", descripcion: "juego semi mundo abierto", tags: ["plataformas","mascota"], imgUrls: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}



struct Video:View{
    
    var url:String
    var body: some View{
        
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
        
    }
    
    
    
}


struct VideoInfo:View{
    
    
    var titulo:String
    var estudio:String
    var calificacion:String
    var añoPublicacion:String
    var descripcion:String
    var tags:[String]
   
    
    
    var body: some View{
        
        
        VStack(alignment: .leading){
            
            Text("\(titulo)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack{
                
                Text("\(estudio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                
                
            }
            
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
                
            
            HStack{
                
                ForEach(tags, id: \.self){
                    
                    tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                    
                }
                
            
                
            }
            
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
        
        
        
    }
    
    
    
    
}


struct Gallery:View{
    
    var imgsUrls: [String]
    let formaGrid = [
    
        GridItem(.flexible())
        
    ]
    
    var body: some View{
        
        
        VStack(alignment: .leading) {
            
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            
            ScrollView(.horizontal){
                
                LazyHGrid(rows: formaGrid, spacing: 8){
                    
                    ForEach(imgsUrls, id: \.self){
                        
                        imgUrl in
                        
                        //desplegar imagenes del servidor por medio de un url
                        
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        
                        
                    }
                    
                    
                    
                    
                }
                
                
                
                
            }.frame(height: 180)
            
            
            
            
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
        
        
        
        
    }
    
    
    
    
}

struct Comments:View{

    var body: some View{
            
        
        VStack(alignment: .leading) {
            Text("COMENTARIOS")
                .foregroundColor(.white)
                .font(.title)
                .padding()
            
            
            ZStack{
                //forma del comentario
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("blue-gray"))
                    .frame(width: 370)
                
                
                VStack(alignment: .leading){
                    //contenido
                    
                    HStack{
                        //imagen
                        Image("user1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .padding(.leading)
                        
                        VStack{
                            Text("Geoff Atto")
                                .foregroundColor(.white)
                                .font(.title3
                                )
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            Text("Hace 7 días")
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }.padding([.leading, .bottom])
                        
                    }
                    
                    Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo.   Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .frame(alignment: .leading)
                        .padding([.leading, .trailing, .top, .bottom], 10.0)
                    
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                 .padding([.top, .leading, .bottom], 15.0)
                
                
                
            }
            ZStack{
                //forma del comentario
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("blue-gray"))
                    .frame(width: 370)
                
                
                VStack(alignment: .leading){
                    //contenido
                    
                    HStack{
                        //imagen
                        Image("user2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .padding(.leading)
                        
                        VStack{
                            Text("Alvy Baack")
                                .foregroundColor(.white)
                                .font(.title3
                                )
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            Text("Hace 12 días")
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }.padding([.leading, .bottom])
                        
                    }
                    
                    Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .frame(alignment: .leading)
                        .padding([.leading, .trailing, .top, .bottom], 10.0)
                    
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                 .padding([.top, .leading, .bottom], 15.0)
                
                
                
            }
            
        }
        

    }



}

struct similarGames:View{
    
    var body: some View{
        
        VStack(alignment: .leading) {
            Text("JUEGOS SIMILARES")
                .foregroundColor(.white)
                .font(.title)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    
                    Image("13-swiftuiapps-2105-rectangle6")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    Image("13-swiftuiapps-2105-rectangle7")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    Image("farcy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    Image("spiderman")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                }
                
                
                
                
                
            }
            
            
            
            
        }
        
        
        
        
        
        
    }
    
    
    
}
