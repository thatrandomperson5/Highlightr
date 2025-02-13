import Foundation

extension URL {
	func bundleLikeURL(forResource: String, withExtension: String?) -> URL? { 
		if #available(iOS 16.0, *) {
			let url = self.appending(component: forResource).appendingPathExtension(withExtension ?? "")
		} else {
			let url = self.appendingPathComponent(forResource).appendingPathExtension(withExtension ?? "")
		}
		guard FileManager.default.fileExists(atPath: url.path()) else {
			return nil
		}
		return url
	}
}
