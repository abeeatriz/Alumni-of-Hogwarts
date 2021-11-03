import Foundation
import UIKit

extension UIViewController {
    
    
    func saveUserDefaults(alumni: Alumni) {
        
        let defaults = UserDefaults.standard
        //UserDefaults
        //Coredata
        //Filemanager
        //Singleton
        
        
        // pegando os alumnis salvos na memoria
        let favoriteAlumni = self.getUserDefaults()
        
        
        // checar se o alumni que estamos querendo salvar já está salvo
        //$0 cada elemento de um for oculto
        if !favoriteAlumni.contains(where: { $0.name == alumni.name }){
            // se não estiver...
            var favoriteDados = getDadosDefault()
            // transformo o alumni que quero salvar em dados
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(alumni) {
                // adiciono o alumni nos dados que já estao salvos
                favoriteDados.append(encoded)
                // salvo o vetor atualizado no user defaults
                defaults.set(favoriteDados, forKey: "alumni")
            }
        }
        //             Mark - Func de desfavoritar
        else {
            var favoriteDados = getDadosDefault()
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(alumni) {
                // adiciono o alumni nos dados que já estao salvos
                favoriteDados = favoriteDados.filter({$0 != encoded})
                
                // salvo o vetor atualizado no user defaults
                defaults.set(favoriteDados, forKey: "alumni")
            }
            
            
        }
        
        _ = self.getUserDefaults()
        
    }
    
    private func getDadosDefault () -> [Data]{
        let defaults = UserDefaults.standard
        if let alumni = defaults.object(forKey: "alumni") as? [Data] {
            return alumni
            
        }
        
        return []
        
    }
    
    func getUserDefaults() -> [Alumni] {
        
        var vetorDeAlumni : [Alumni] = []
        let dados = getDadosDefault()
        for alumni in dados{
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Alumni.self, from: alumni) {
                
                vetorDeAlumni.append(loadedPerson)
            }
            
        }
        
        return vetorDeAlumni
        
    }
    
}

