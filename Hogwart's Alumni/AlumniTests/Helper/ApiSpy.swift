import Foundation
@testable import Alumni

class APISpy: AlumniApi {
    var apiCalls = 0

    func setAlumnisURL() -> String {
        return ""
    }
    
    
    func getAlumni(urlString: String, method: HTTPMethod, completion: @escaping (Result<[Alumni], AlumniApiError>) -> Void) {
        apiCalls += 1
        completion(Result.success([])) // Se for o caso, podemos incluir algum retorno aqui para fazer testes de estado
    }

}
