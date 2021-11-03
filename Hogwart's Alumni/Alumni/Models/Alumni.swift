import Foundation

//Codable -> Encodable e Decodable
//Decodable -> Pega o JSON da API e transforma na class ou struct
//Encodable -> Pega a class ou struct e transforma em um JSON

struct Alumni: Codable {
//struct Alumni: Codable, Equatable {
    
    enum CodingKeys: String, CodingKey {

        case name
        case species
        case house
        case dateOfBirth
        case patronus
        case alive
        case image
        
    }

    var name           : String?
    var species        : String?
    var house          : String?
    var dateOfBirth    : String?
    var patronus       : String?
    var alive          : Bool?
    var image          : String?
    
    //init seria util para adicionar um novo alumni (C do CRUD)
//    init(
//        name           : String? = nil,
//        species        : String? = nil,
//        house          : String? = nil,
//        dateOfBirth    : String? = nil,
//        patronus       : String? = nil,
//        alive          : Bool?   = nil,
//        image          : String? = nil
//    ){
//        self.name           =  name
//        self.species        =  species
//        self.house          =  house
//        self.dateOfBirth    =  dateOfBirth
//        self.patronus       =  patronus
//        self.alive          =  alive
//        self.image          =  image
//
//    }
}
    
    /*
}
[{"name":"Harry Potter",=======================
"alternate_names":[""],
"species":"human",=============================
"gender":"male",
"house":"Gryffindor",==========================
"dateOfBirth":"31-07-1980",
"yearOfBirth":1980,============================
"wizard":true,
"ancestry":"half-blood",
"eyeColour":"green",
"hairColour":"black",
"wand":{"wood":"holly",
       "core":"phoenix feather",
       "length":11},
"patronus":"stag",=============================
"hogwartsStudent":true,
"hogwartsStaff":false,
"actor":"Daniel Radcliffe",
"alternate_actors":[""],
"alive":true,====================================
"image":"http://hp-api.herokuapp.com/images/harry.jpg"},===================


http://hp-api.herokuapp.com/api/characters/students

*/
