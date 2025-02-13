import Foundation

extension URL {
    func bundleLikeURL(forResource: String, withExtension: String?) -> URL? { 
        let url = if #available(iOS 16.0, *) {
            self.appending(component: forResource).appendingPathExtension(withExtension ?? "")
        } else {
            self.appendingPathComponent(forResource).appendingPathExtension(withExtension ?? "")
        }
        
        let files = try? FileManager.default.contentsOfDirectory(at: self, includingPropertiesForKeys: nil)
        
        guard files?.contains(url) ?? false else {
            return nil
        }
        return url
    }
}
