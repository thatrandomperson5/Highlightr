import Foundation

extension URL {
	func bundleLikeURL(forResource: String, withExtension: String?) -> URL? { 
		let url = self.appending(component: forResource).appendingPathExtension(withExtension ?? "")
		guard FileManager.default.fileExists(atPath: url.path()) else {
			return nil
		}
		return url
	}
}
