import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    
    var arrayDeAlumnis: [Alumni] = []
    var api: AlumniApi?
    
    let reuseIdentifier = "Celula"
    var favoritos : Bool = false

    lazy var uitv_Tabela: UITableView = {

        var tabela = UITableView()
        tabela.frame = self.view.bounds
        tabela.dataSource = self
        tabela.delegate = self
        
        let nib = UINib(nibName: "CelulaCustomizadaAlumniTableViewCell", bundle: nil)
        tabela.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
        return tabela

    }()
    
    convenience init(api: AlumniApi) {
        self.init()
        self.api = api
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Alumni of Hogwarts"
        
        self.view.addSubview(self.uitv_Tabela)
        
        self.populaArrayDeAlumnisAtualizaTableView() { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let alumnis):
                self?.arrayDeAlumnis = alumnis
                DispatchQueue.main.async {
                    self?.uitv_Tabela.reloadData()
                }
            case .failure(let error):
                print(error)
            }

        }
        
        self.createRightBarButton()
        
    }
    
    func populaArrayDeAlumnisAtualizaTableView(completion: @escaping (Result<[Alumni], AlumniApiError>) -> Void) {
        
        if !favoritos {
            guard let mApi = self.api else { return }
            
            mApi.getAlumni(urlString: mApi.setAlumnisURL(), method: .GET) {
                [weak self] result in
                guard self != nil else { return }

                switch result {
                case .success(let alumnis):
                    completion(Result.success(alumnis))
                case .failure(let error):
                    completion(Result.failure(error))
                }
                
            }
            
        } else {
            let alumnis = self.getUserDefaults()
            for item in alumnis {
                self.arrayDeAlumnis.append(item)
            }
        }
        self.uitv_Tabela.reloadData()
        
    }
    
    func createRightBarButton() {
        
        let heartImage = UIImage(systemName: "heart.fill")
        
        let rightButton = UIBarButtonItem(image: heartImage, style: UIBarButtonItem.Style.plain, target: self , action: #selector(getFavoritos))
        rightButton.tintColor = .red
        
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func getFavoritos() {
        let vc = ViewController()
        vc.favoritos = true
        self.show(vc, sender: nil)
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayDeAlumnis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CelulaCustomizadaAlumniTableViewCell
        
        cell?.uil_Titulo.text = self.arrayDeAlumnis[indexPath.row].name
        cell?.uil_Note.text = self.arrayDeAlumnis[indexPath.row].house
        cell?.uil_Note.adjustsFontSizeToFitWidth = false
        cell?.uil_Note.numberOfLines = 0
        
        
        if let image = self.arrayDeAlumnis[indexPath.row].image {
            
            let url = URL(string: image)
            
            cell?.uiiv_Image.kf.setImage(
                with: url,
                placeholder: UIImage(named: "hat"),
                options: [
                    .transition(ImageTransition.fade(3.0))
                ],
                progressBlock: nil,
                completionHandler: { resultado in
                    switch resultado {
                    case .success(let image):
                        print(image.cacheType)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 146.0
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = DetailViewController()
        
        detail.alumniTocado = self.arrayDeAlumnis[indexPath.row]
        
        self.show(detail, sender: nil)
    }
    
}



