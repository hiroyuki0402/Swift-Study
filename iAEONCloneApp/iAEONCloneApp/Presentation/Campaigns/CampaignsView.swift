import SwiftUI
import Observation
import Kingfisher

struct CampaignsView: View {
    @State var viewmodel: CampaignsViewModel = .init()
    var gridItems: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        ScrollView {

            LazyVGrid(columns: gridItems) {
                ForEach(viewmodel.campaigs) { campaign in
                    VStack(spacing: 0) {
                        KFImage(URL(string: campaign.imageUrl))
                            .resizable()
                            .scaledToFit()
                            .frame(height: 90, alignment: .topLeading)

                        VStack {
                            Text(campaign.title)
                                .lineLimit(3)

                            Spacer()

                            Text(campaign.date)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.bottom, 2)

                            Text(campaign.type)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.bottom, 8)

                        }
                        .frame(height: 120)
                    }

                    .background(.white)
                    .clipShape(.rect(cornerRadius: 10))

                }
            }
            .padding(.horizontal, 10)
            .shadow(radius: 2)
            .padding(.bottom)
        }
        .ignoresSafeArea()
        .padding(.vertical)
        .background(Color(uiColor: .systemGray6))
        .navigationTitle("キャンペーン・お店から")
        .navigationBarTitleDisplayMode(.inline)

    }
}

#Preview {
    NavigationStack {
        CampaignsView()
    }
}


@Observable
class CampaignsViewModel {
    var campaigs: [CampaignData] = []

    init() {
        campaigs = getCampaigns()
    }
}


struct CampaignData: Hashable, Identifiable {
    var id = UUID().uuidString
    var imageUrl: String
    var title: String
    var date: String
    var type: String
}


func getCampaigns() -> [CampaignData] {
    return [
        .init(imageUrl: "https://placehold.jp/3d4070/ffffff/630x280.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B31",
              title: "[イオンカード] USJに貸し切りご招待テストテスト・テストテスト",
              date: "2025年06月03日",
              type: "キャンペーン"),

            .init(imageUrl:"https://placehold.jp/3d4070/ffffff/630x280.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B32",
                  title: "[イオンカード] USJに貸し切りご招待テストテスト・テストテスト",
                  date: "2025年06月03日",
                  type: "おすすめ"),

            .init(imageUrl:"https://placehold.jp/3d4070/ffffff/630x280.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B33",
                  title: "[イオンカード] USJに貸し切りご招待テストテスト・テストテスト",
                  date: "2025年06月03日",
                  type: "おすすめ"),

            .init(imageUrl:"https://placehold.jp/3d4070/ffffff/630x280.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B34",
                  title: "[イオンカード] USJに貸し切りご招待テストテスト・テストテスト",
                  date: "2025年06月03日",
                  type: "キャンペーン"),

            .init(imageUrl:"https://placehold.jp/3d4070/ffffff/630x280.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B35",
                  title: "[イオンカード] USJに貸し切りご招待テストテスト・テストテスト",
                  date: "2025年06月03日",
                  type: "おすすめ"),

            .init(imageUrl:"https://placehold.jp/3d4070/ffffff/630x280.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B36",
                  title: "[イオンカード] USJに貸し切りご招待テストテスト・テストテスト",
                  date: "2025年06月03日",
                  type: "キャンペーン"),

            .init(imageUrl:"https://placehold.jp/3d4070/ffffff/630x280.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B37",
                  title: "[イオンカード] USJに貸し切りご招待テストテスト・テストテスト",
                  date: "2025年06月03日",
                  type: "おすすめ"),

            .init(imageUrl:"https://placehold.jp/3d4070/ffffff/630x280.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B38",
                  title: "[イオンカード] USJに貸し切りご招待テストテスト・テストテスト",
                  date: "2025年06月03日",
                  type: "おすすめ"),

            .init(imageUrl:"https://placehold.jp/3d4070/ffffff/630x280.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B39",
                  title: "[イオンカード] USJに貸し切りご招待テストテスト・テストテスト",
                  date: "2025年06月03日",
                  type: "おすすめ"),

            .init(imageUrl:"https://placehold.jp/3d4070/ffffff/630x280.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B310",
                  title: "[イオンカード] USJに貸し切りご招待テストテスト・テストテスト",
                  date: "2025年06月03日",
                  type: "キャンペーン")
    ]
}
