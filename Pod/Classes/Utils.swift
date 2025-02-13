import Foundation

extension URL {
    func bundleLikeURL(forResource: String, withExtension: String?) -> URL? { 
        let url = if #available(iOS 16.0, *) {
            self.appending(component: forResource).appendingPathExtension(withExtension ?? "")
        } else {
            self.appendingPathComponent(forResource).appendingPathExtension(withExtension ?? "")
        }
        guard FileManager.default.fileExists(atPath: url.path()) else {
            return nil
        }
        return url
    }
}
