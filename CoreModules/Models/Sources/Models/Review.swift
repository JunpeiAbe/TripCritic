import Foundation
/// レビュー
public struct Review: Decodable {
    let id: Int
    let rating: Double
    let comment: String
    let postDate: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case rating
        case comment
        case postDate = "post_date"
    }
}
