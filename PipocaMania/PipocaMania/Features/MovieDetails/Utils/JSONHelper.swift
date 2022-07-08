import Foundation

final class JSONHelper {
    class func getDataFrom(json file: String) -> Data? {
        guard let path = Bundle(for: JSONHelper.self).path(forResource: file, ofType: "json") else {
            fatalError("file not found / name: \(file)")
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            print(data.prettyPrintedJSONString ?? "")
            return data
        } catch {
            fatalError("malformed json / error: \(error)")
        }
    }
}
