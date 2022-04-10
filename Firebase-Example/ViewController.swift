
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var Label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Action1(_ sender: Any) {
        APIManager.shared.getPost(collection: "guitars", docName: "ClassicGuitars",  complition: {doc in
            guard doc != nil else {return}
            self.Label1.text = doc?.field1
            self.Label2.text = doc?.field2
        })
        APIManager.shared.getImage(picName: "can", completion: {pic in
            self.picture.image = pic
        })
    }
    @IBAction func Action2(_ sender: Any) {
        APIManager.shared.getPost(collection: "guitars", docName: "DreadNoute",  complition: {doc in
            guard doc != nil else {return}
            self.Label1.text = doc?.field1
            self.Label2.text = doc?.field2
        })
        APIManager.shared.getImage(picName: "can" , completion: {pic in
            self.picture.image = pic
        })
    }
    @IBAction func Action3(_ sender: Any) {
        APIManager.shared.getPost(collection: "guitars", docName: "ElectricGuitars",  complition: {doc in
            guard doc != nil else {return}
            self.Label1.text = doc?.field1
            self.Label2.text = doc?.field2
        })
        APIManager.shared.getImage(picName: "board", completion: {pic in
            self.picture.image = pic
        })
    }
}

