import Foundation

extension URL {
    func bundleLikeURL(forResource: String, withExtension: String?) -> URL? { 
        let url = if #available(iOS 16.0, *) {
            self.appending(component: forResource).appendingPathExtension(withExtension ?? "")
        } else {
            self.appendingPathComponent(forResource).appendingPathExtension(withExtension ?? "")
        }
        
        let path = if #available(iOS 16.0, *) {
            url.path()
        } else {
            url.path
        }
        guard FileManager.default.fileExists(atPath: path) else {
            return nil
        }
        return url
    }
}
