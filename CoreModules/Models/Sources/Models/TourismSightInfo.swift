import Foundation
/// 観光地情報
public struct TourismSightInfo: Decodable {
    let id: Int
    let name: String
    let image: URL
    let description: String
    let latitude: Double
    let longitude: Double
    let averageRating: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case description
        case latitude
        case longitude
        case averageRating = "average_rating"
    }
}
