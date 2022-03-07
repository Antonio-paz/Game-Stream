//
//  FavoritosView.swift
//  GameStream
//
//  Created by Antonio Paz on 24/02/22.
//

import SwiftUI
import AVKit

struct FavoritosView: View {
 
    @ObservedObject var todosLosVideoJuegos = ViewModel()
    
    
    var body: some View {
        
        
        
        ZStack {
            
            Color("blue-hiden").ignoresSafeArea()
            
            
            
            VStack {
                
                Text("FAVORITOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 9.0)
                
                
                ScrollView(){
                    
                    ForEach(todosLosVideoJuegos.gamesInfo, id: \.self){
                        
                        juego in
                        
                        VStack(spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!))
                                .frame(height: 200)
                            
                            Text("\(juego.title)")
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("blue-gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3.0))
                                .font(.subheadline)
                            
                            
                            
                        }
                            
                        
                    }
                 
                    
                    
                }.padding(.bottom, 8.0)
                
                
                
            }.padding(.horizontal, 6.0)
                
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
        
        
        
        
    }
}

struct FavoritosView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritosView()
    }
}
