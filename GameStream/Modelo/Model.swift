//
//  Model.swift
//  GameStream
//
//


/*
   vamos a crear nuestro modelo de datos para Json los archivos modelos se utilizan para modelar este tipo de datos para que la app pueda recuperarla y tambien por que en la arquitectura MVVM vamos a separar la logia en modelo vista vista-modelo en este archivo del modelo vamos a escribir toda la logia de nuestra app aqui no pueden ir vistas solo logica. */

/*
 Swift no sabe que es un json es por eso que nosotros le tenemos que traducir de alguna manera los datos con Codable o segun el comentario de platzi Quick Type
 
 el codable es para codificar y decodificar de esta forma codificamos para el servidor y descodificamos para nuestra app
 
 vamos a crear otra estructura que se llame games con codable para que tambien pueda hacer lo mismo que la estructura de arriba
 
 */

import Foundation

struct Resultados:Codable{
    
    
    var results:[Game]
    
    
    
}

struct Games:Codable{
    
    
    var games:[Game]
    
    
    
}


struct Game: Codable, Hashable{
    
    
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls: videoUrl
    var galleryImages:[String]
    
}



/* necesitamos crear un json para video url por que almacena un json con links dentro*/
struct videoUrl:Codable, Hashable{
    
    var mobile:String
    var tablet:String
    
    
    
    
}

/* vamos a estar utilizando el protocolo hashable para poder iterar dentro de los arrays y nos da error por que tambien se lo tenemos que agregar a otras estructuras que estemos utilizando en la struc game como por ejemplo el video. */



