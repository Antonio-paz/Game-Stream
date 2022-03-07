//
//  SearchGame.swift
//  GameStream
//
//  Created by Antonio Paz on 23/02/22.
//


// tenemos una api que nosotros le podemos pasar el nombre del video juego y me devolveran los juegos necesarios para capturarlos en game info y pegarlo en otra variable resultado.
import Foundation


class SearchGame: ObservableObject{
    
    @Published var gameInfo = [Game]()
    
    func search(gameName: String) {
        // esto es para que cuando buscamos de nuevo eliminemos todo resultado que tengamos antes
        gameInfo.removeAll()
        
        //esto es para que la url tenga espacios dentro de la peticion esto se hace por que los nombres de los juegos tienen espacios
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        //peticion a la api
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        

        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        

        URLSession.shared.dataTask(with: request) { data, response, error in


            do{

                if let jsonData = data {
                    print("el tamaño del json es: \(jsonData)")


                    let decodeData = try
                    //formato a decodificar
                    JSONDecoder().decode(Resultados.self, from: jsonData)

                    //parte asincrona

                    DispatchQueue.main.async {

                        self.gameInfo.append(contentsOf: decodeData.results)

                    }
                }



            }catch{



                print("El error es el siguente \(error)")



            }

        }.resume()

        
        
    }
    
        
      
        
        
    
    
    
}
