import XCTest
@testable import Alumni // importa todo o projeto - outra opcao utilizar public

class IntegrationTests: XCTestCase {
    func testAPIIntegration() {

        // Setup
        let api = API()
        let sut = ViewController(api: api) //Cria uma nova View Controller
        sut.loadViewIfNeeded() //Necessário rodar isso pois nao estamos associando tela

        // Exercise
        sleep(5)
        guard sut.arrayDeAlumnis.count > 0 else {
            XCTFail()
            return
        }
        let caracteresDoNomeDoPrimeiroAlumni = sut.arrayDeAlumnis[0].name?.count ?? 0
        XCTAssertTrue(caracteresDoNomeDoPrimeiroAlumni > 0)
    }
}
