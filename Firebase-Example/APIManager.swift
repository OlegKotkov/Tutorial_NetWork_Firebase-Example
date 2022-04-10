
import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase


class APIManager {
    
    //СинглТон
    static let shared = APIManager()
    
    //Создаем функцию по конфигурации базы данных
    private func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    // Методы с помощью которых запрашиваем информацию из удаленных баз данных
    func getPost (collection: String, docName: String, complition: @escaping(Document?)-> Void) {
        let db = configureFB()
        db.collection(collection).document(docName).getDocument(completion: {(document,error) in
            guard error == nil else {complition (nil);return }
            let doc = Document(field1: document? .get("field1")as! String, field2: document? .get("field2")as! String)
            complition(doc)
    })
}
    // Функция для получения изображения из Storage
    func getImage (picName: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathRef = reference.child("pictures")
        
        //Если нам не придет изображение, то вернется "defaut_pic"
        var image: UIImage = UIImage(named: "default_pic")!
        
        // Задаем референс для самого изображения
        let fileRef = pathRef.child(picName + ".jpeg")
        fileRef.getData(maxSize: 1024*1024, completion: {data, error in
            guard error == nil else {completion(image); return}
            image = UIImage(data: data!)!
            completion(image)
        })
    }
    
}
