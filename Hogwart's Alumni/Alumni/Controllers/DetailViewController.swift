import UIKit

class DetailViewController: UIViewController {
    
    let reuseIdentifier = "cell"
    var alumniTocado: Alumni = Alumni()
    lazy var uitv_Tabela: UITableView = {

        var tabela = UITableView()
        tabela.frame = self.view.bounds
        tabela.dataSource = self
        tabela.delegate = self
        
        return tabela
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(uitv_Tabela)
        title = alumniTocado.name
        
        self.uitv_Tabela.backgroundColor = House.getColor(house: alumniTocado.house ?? "")
    }
    
}

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // retornos por linha
        // 0 imagem
        // 1 nome
        // 2 especie
        // 3 house
        // 4 dateOfBirth
        // 5 patronous
        // 6 alive
        // 7 favorito
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        cell.backgroundColor = .clear
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 16.0)
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        switch indexPath.row {
        case 0:
            let cellImage = ImageViewCell()
            guard let urlString = alumniTocado.image else { return UITableViewCell() }
            guard let url = URL(string: urlString) else { return UITableViewCell() }
            cellImage.setImageView(url: url, rounded: true)
            return cellImage
        case 1:
            if let name = alumniTocado.name {
                cell.textLabel?.text = "Name: "
                cell.detailTextLabel?.text = "\(name)"
            }
        case 2:
            if let specie = alumniTocado.species {
                cell.textLabel?.text = "Species: "
                cell.detailTextLabel?.text = "\(specie)"
                
            }
        case 3:
            if let house = alumniTocado.house {
                cell.textLabel?.text = "House: "
                cell.detailTextLabel?.text = "\(house)"
            }
        case 4:
            if let dateOfBirth = alumniTocado.dateOfBirth {
                cell.textLabel?.text = "Date Of Birth: "
                cell.detailTextLabel?.text = "\(dateOfBirth)"
   
            }
        case 5:
            if let patronus = alumniTocado.patronus {
                cell.textLabel?.text = "Patronum: "
                cell.detailTextLabel?.text = "\(patronus)"
                
            }
        case 6:
            if let isAlive = alumniTocado.alive {
                cell.textLabel?.text = isAlive ? "Is current alive":"Isn't current alive"
        }
            
        case 7:
            cell.textLabel?.text = "Adicionar aos favoritos"
            cell.accessoryType = .disclosureIndicator
            
        default:
            return UITableViewCell()
        }
        return cell
        
    }
    
}


extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 7 {
            
            
            self.saveUserDefaults(alumni: alumniTocado)
            
            
            ///funcao para abrir lista de favoritos
            let vc = ViewController()
            vc.favoritos = true
            self.show(vc, sender: nil)
                
        }
        
    }
    
}
