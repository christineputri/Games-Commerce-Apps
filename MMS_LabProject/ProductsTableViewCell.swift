import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var itemDetailProduct: UILabel!
    @IBOutlet weak var itemPriceProduct: UILabel!
    @IBOutlet weak var itemCategoryProduct: UILabel!
    @IBOutlet weak var itemTitleProduct: UILabel!
    @IBOutlet weak var itemImageProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
