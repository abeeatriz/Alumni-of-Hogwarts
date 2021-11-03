import UIKit
import SnapKit

class CelulaCustomizadaAlumniTableViewCell: UITableViewCell {

    @IBOutlet weak var uil_Titulo: UILabel!
    @IBOutlet weak var uil_Note: UILabel!
    @IBOutlet weak var uiiv_Image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        uil_Titulo.snp.makeConstraints { make in
            
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(uiiv_Image.snp.left).offset(-10)
            make.bottom.equalTo(uil_Note.snp.top).offset(-10)
            
        }
        
        uil_Note.snp.makeConstraints { make in
            
            make.top.equalTo(uil_Titulo.snp.bottom).offset(10)
            make.left.equalTo(uil_Titulo.snp.left).offset(0)
            make.right.equalTo(uiiv_Image.snp.left).offset(-10)
            make.bottom.greaterThanOrEqualTo(self).offset(-10)
            
        }
        
        uiiv_Image.snp.makeConstraints { make in
            
            make.centerY.equalTo(self).offset(0)
            make.right.equalTo(self).offset(-30)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
