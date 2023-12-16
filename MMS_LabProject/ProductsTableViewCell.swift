import UIKit

class ProductsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemDetailProduct: UILabel!
    @IBOutlet weak var itemPriceProduct: UILabel!
    @IBOutlet weak var itemCategoryProduct: UILabel!
    @IBOutlet weak var itemTitleProduct: UILabel!
    @IBOutlet weak var itemImageProduct: UIImageView!
    @IBOutlet weak var quantityField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
