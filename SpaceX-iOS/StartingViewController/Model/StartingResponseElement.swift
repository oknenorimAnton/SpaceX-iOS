
import Foundation

struct LaunchData: Decodable {
    let rocket: Rocket
    let name: String
    let dateLocal: String
    var success: Bool?
    
    enum CodingKeys: String, CodingKey {
        case rocket, name
        case dateLocal = "date_local"
        case success
    }
}

enum Rocket: String, Codable {
    case the5E9D0D95Eda69955F709D1Eb = "5e9d0d95eda69955f709d1eb"
    case the5E9D0D95Eda69973A809D1Ec = "5e9d0d95eda69973a809d1ec"
    case the5E9D0D95Eda69974Db09D1Ed = "5e9d0d95eda69974db09d1ed"
}
