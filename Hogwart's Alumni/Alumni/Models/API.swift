import Foundation

class API: AlumniApi {

    
    let baseURL = "http://hp-api.herokuapp.com/api/characters/students"
    /// Returns the URL string to endpoint: /students
    func setAlumnisURL() -> String {
        return "\(self.baseURL)"
    }
    
    
    /// Returns an array of Alumni -> If nil = []
    func getAlumni(urlString: String, method: HTTPMethod, completion: @escaping (Result<[Alumni], AlumniApiError>) -> Void) {

        // Criar array de alumni
        var _ : [Alumni] = []
        // Config sessão
        let config: URLSessionConfiguration = .default
        // Sessão
        let session: URLSession = URLSession(configuration: config)
        // URL
        guard let url: URL = URL(string: urlString) else { return }
        // URL Request
        var urlRequest: URLRequest = URLRequest(url: url)
        // URL Request -> Method (GET)
        urlRequest.httpMethod = "\(method)"
        // EXEC request HTTP
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (result, urlResponse, error) in
            
            var statusCode: Int = 0
            if let response = urlResponse as? HTTPURLResponse {
                statusCode = response.statusCode
                print(statusCode)
            }
            
            guard let data = result else {
                completion(Result.failure(AlumniApiError.emptyData))
                return
                
            } // precisa retornar o erro de DATA = nil
            
            do {
                // criar um decoder
                let decoder : JSONDecoder = JSONDecoder()
                // decodificar
                let decodeData: [Alumni] = try decoder.decode([Alumni].self, from: data)
                completion(Result.success(decodeData))
                
            } catch {
                completion(Result.failure(AlumniApiError.invalidData))
            }
        }
        )
        task.resume()
    }
}
