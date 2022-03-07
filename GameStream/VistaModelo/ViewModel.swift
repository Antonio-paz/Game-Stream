//
//  ViewModel.swift
//  GameStream
//
//  Created by Antonio Paz on 16/02/22.
//

/* Lo vamos a utilizar para hacer llamados al servidor*/

import Foundation
import SwiftUI

class ViewModel:ObservableObject{
    
    @Published var gamesInfo = [Game]()
    
    init() {
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            do{
                
                if let jsonData = data {
                    print("el tamaño del json es: \(jsonData)")
                    
                    
                    let decodeData = try
                    //formato a decodificar
                    JSONDecoder().decode([Game].self, from: jsonData)
                    
                    //parte asincrona
                    
                    DispatchQueue.main.async {
                        
                        self.gamesInfo.append(contentsOf: decodeData)
                        
                    }
                }
                
                
                
            }catch{
                
                
                
                print("El error es el siguente \(error)")
                
                
                
            }
            
        }.resume()
        
        
        
        
        
        
    }
    
    
    
}
