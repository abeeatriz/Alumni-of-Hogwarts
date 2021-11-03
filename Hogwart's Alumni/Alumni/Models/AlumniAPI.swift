import Foundation

protocol AlumniApi {
    func setAlumnisURL() -> String

    
    func getAlumni(urlString: String, method: HTTPMethod,completion: @escaping (Result<[Alumni], AlumniApiError>) -> Void)
    

}
