import UIKit

final class ImageLoader {
    func loadImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let data = data {
                let image = UIImage.init(data: data)
                completion(image)
            }
        }.resume()
    }
}
