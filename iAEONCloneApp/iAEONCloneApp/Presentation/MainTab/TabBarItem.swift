
enum MainTab: Int, CaseIterable, Identifiable {
    case home
    case campaigns
    case middle
    case productsearch
    case mypage

    var id: Int {
        self.rawValue
    }

    var title: String {
        switch self {
        case .home:
            return "ホーム"
        case .campaigns:
            return "キャンペーン"
        case .middle:
            return ""
        case .productsearch:
            return "店舗検索"
        case .mypage:
            return "マイページ"
        }
    }

    var imageResource: String {
        switch self {
        case .home:
            return "house"
        case .campaigns:
            return "star"
        case .middle:
            return ""
        case .productsearch:
            return "storefront"
        case .mypage:
            return "person.circle"
        }
    }
}
