//
//  SaveData.swift
//  GameStream
//
//  Created by Antonio Paz on 5/03/22.
//

import Foundation
import SwiftUI

class SaveData{
    
    var correo:String = ""
    var contraseña:String = ""
    var nombre:String = ""
    
    
    
    func registrar(correo:String, contraseña:String) -> Bool {
        
        UserDefaults.standard.set([correo, contraseña], forKey: "DatosUsuario")
        
        return true
        
    }
    
    func recuperarDatosRegistro() -> [String] {
        
        let DatosUsuario: [String] = UserDefaults.standard.stringArray(forKey: "DatosUsuario")!
        
        print("estoy en el metodo recuperar datos y esto fue lo que recupere: \(DatosUsuario)")
        
        return DatosUsuario
        
    }
    
    func guardarDatos(correo:String, contraseña:String, nombre:String) -> Bool{
        
        print("Dentro de la funcion guardar datos obtuve: \(correo) + \(contraseña) + \(nombre) ")
        
        
        //esto es para guardar pequeños datos internos
        UserDefaults.standard.set([correo, contraseña, nombre], forKey: "datosUsuario")
        
        return true
        
    }
    
    
    
    func recuperarDatos() -> [String] {
        
        let datosUsuario: [String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        
        print("estoy en el metodo recuperar datos y esto fue lo que recupere: \(datosUsuario)")
        
        return datosUsuario
        
    }
    
    
    func validar(correo:String, contraseña:String) -> Bool {
        
        var correoGuardado = ""
        var contraseñaGuardada = ""
        
        
        print("Revisando si tengo user defaults con el correo \(correo) y la contraseña: \(contraseña)")
        
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil{
            
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            contraseñaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            
            print("el correo guardado es: \(correoGuardado) y la contra es: \(contraseñaGuardada)")
            
            
            if(correo == correoGuardado && contraseña == contraseñaGuardada){
                
                return true
                
            }else{
                
                return false
                
            }
            
            
            
        }else{
            
            print("no tenemos datos guardados en el userDefaults")
            
            return false
          
            
        }
        
        
    }
    
    
}


