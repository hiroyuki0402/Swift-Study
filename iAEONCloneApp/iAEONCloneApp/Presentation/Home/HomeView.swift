import SwiftUI
import Observation
import Kingfisher

struct HomeView: View {

    @State var viewmodel: HomeViewModel = .init()

    var colmns: [GridItem] {
        Array(repeating: .init(.flexible(), spacing: 5), count: 4)
    }

    var body: some View {
        ScrollView {
            VStack {
                paymentArea()
                nonFavoriteUI()
                serviceArea()
                campaignArea()
                eventArea()
            }
        }
        .ignoresSafeArea()
        .padding(.vertical)
        .background(Color(uiColor: .systemGray5))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {

            ToolbarItem(placement: .principal) {
                HStack(spacing: 2) {
                    Text("i")
                        .foregroundStyle(.red)
                    Text("AEON")
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button {

                } label: {
                    VStack {
                        Image(systemName: "bell")
                        Text("お知らせ")
                            .font(.caption)
                    }
                }
            }
        }
    }
}

extension HomeView {

    // MARK: - PaymentArea
    func paymentArea() -> some View {
        HStack {
            waonPointButton
            eonpayButton
            waonPayButton
        }
    }

    var waonPointButton: some View {
        paymentButton(title: "WAON Point") {

        }
    }

    var eonpayButton: some View {
        paymentButton(title: "EONPAY") {

        }
    }

    var waonPayButton: some View {
        paymentButton(title: "WAON Pay") {

        }

    }

    func paymentButton(title: String? = nil, imageSystemName: String? = nil, didTap: @escaping () -> Void) -> some View {
        Button {
            didTap()
        } label: {
            if let title = title {
                Text(title)

                    .frame(width: UIScreen.main.bounds.width / 4)
                    .frame(height: 60)
                    .background()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10).stroke(.black, lineWidth: 1)
                        
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(radius: 2)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 3)

            } else if let imageSystemName = imageSystemName {
                Image(systemName: imageSystemName)

            } else {
                Text("Pay")
            }

        }
    }

    // MARK: - FavoriteStore
    func nonFavoriteUI() -> some View {
        VStack {
            Text("お気に入り店舗")
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 20)
                .padding()

            Image(systemName: "ticket.fill")
                .resizable()
                .frame(width: 250, height: 200)

            Text("よく行くお店を登録してオトクなクーポンや便利な情報をチェックしましょう。")
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button("お気に入り店舗登録") {

            }
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color(uiColor: #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)))
            .clipShape(.capsule)
            .padding(.bottom)

        }
        .background()
    }

    // MARK: - Service
    func serviceArea() -> some View {
        VStack {

            HStack {
                Text("イオンサービス")
                    .fontWeight(.semibold)

                Spacer()
                Button {

                } label: {
                    HStack(spacing: 2) {
                        Text("もっと見る")
                            .font(.caption)
                            .foregroundStyle(.purple)

                        Image(systemName: "greaterthan")
                            .foregroundStyle(.gray.opacity(0.5))
                    }
                }
            }
            .padding(.vertical)
            .padding(.horizontal)

            LazyVGrid(columns: colmns) {
                ForEach(viewmodel.aEONService) { service in
                    serviceUI(service: service)
                }
            }
        }
        .background(.white)
    }

    func serviceUI(service: AEONService) -> some View {
        VStack(spacing: 4) {
            ZStack {
                Image(systemName: service.imageName)
            }
            .padding(10)
            .background(.white)
            .clipShape(.circle)
            .shadow(radius: 4)
            Text(service.title)
                .font(.caption)
                .multilineTextAlignment(.center)

        }
        .frame(height: 80 , alignment: .top)
        .padding(.horizontal)
        .padding(.top)
        .onTapGesture {
            print("\(service.title)を押下")
        }
    }


    // MARK: キャンペーン
    func campaignArea() -> some View {
        VStack {
            Text("イチ押しのキャンペーン")
                .padding(.top)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewmodel.recomendCampaigns) { campaign in
                        KFImage(URL(string: campaign.imageUrl))
                            .resizable()
                            .frame(width: 120, height: 140)
                            .scaledToFit()

                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .background(.white)
    }

    // MARK: - イベント
    func eventArea() -> some View {
        VStack {
            Text("注目のイベント")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewmodel.eventCampaigns) { campaign in
                        KFImage(URL(string: campaign.imageUrl))
                            .resizable()
                            .frame(width: 120, height: 140)
                            .scaledToFit()

                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)

        }
        .background(.white)
    }
}


#Preview {
    NavigationStack {
        HomeView()
    }
}


struct AEONService: Hashable, Identifiable {
    var id = UUID().uuidString
    var title: String
    var imageName: String
}
struct recomendCampaigns: Hashable, Identifiable {
    var id = UUID().uuidString
    var imageUrl: String
}

struct eventCampaigns: Hashable, Identifiable {
    var id = UUID().uuidString
    var imageUrl: String
}

func getAEONServices() -> [AEONService] {
    return [
        .init(title: "オーナーズカード", imageName: "person.text.rectangle.fill"),
        .init(title: "イオンラウンジ", imageName: "sofa"),
        .init(title: "WAONステーション", imageName: "iphone.gen1.radiowaves.left.and.right"),
        .init(title: "AEONWALET", imageName: "wallet.bifold"),
        .init(title: "イオン銀行通帳アプリ", imageName: "bitcoinsign.bank.building"),
        .init(title: "電子レシート", imageName: "note.text"),
        .init(title: "My SECU", imageName: "scribble.variable"),
        .init(title: "グリーンビーンズ", imageName: "bus.fill")
    ]
}

func getRecomendCampaigns() -> [recomendCampaigns] {
    return [
        .init(imageUrl: "https://placehold.jp/3d4070/ffffff/200x200.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B31"),
        .init(imageUrl: "https://placehold.jp/3d4070/ffffff/200x200.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B32"),
        .init(imageUrl: "https://placehold.jp/3d4070/ffffff/200x200.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B33"),
        .init(imageUrl: "https://placehold.jp/3d4070/ffffff/200x200.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B34"),
        .init(imageUrl: "https://placehold.jp/3d4070/ffffff/200x200.png?text=%E3%82%A4%E3%83%81%E3%82%AA%E3%82%B7%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%9A%E3%83%BC%E3%83%B35")
        ]
}

func getEventCampaigns() -> [eventCampaigns] {
    return [
        .init(imageUrl: "https://placehold.jp/3d4070/ffffff/200x200.png?text=%E3%82%A4%E3%83%99%E3%83%B3%E3%83%881"),
        .init(imageUrl: "https://placehold.jp/3d4070/ffffff/200x200.png?text=%E3%82%A4%E3%83%99%E3%83%B3%E3%83%882"),
        .init(imageUrl: "https://placehold.jp/3d4070/ffffff/200x200.png?text=%E3%82%A4%E3%83%99%E3%83%B3%E3%83%883"),
        .init(imageUrl: "https://placehold.jp/3d4070/ffffff/200x200.png?text=%E3%82%A4%E3%83%99%E3%83%B3%E3%83%884"),
        .init(imageUrl: "https://placehold.jp/3d4070/ffffff/200x200.png?text=%E3%82%A4%E3%83%99%E3%83%B3%E3%83%885")
        ]
}

@Observable
class HomeViewModel {

    var aEONService: [AEONService] = []
    var recomendCampaigns: [recomendCampaigns] = []
    var eventCampaigns: [eventCampaigns] = []

    init() {
        self.aEONService = getAEONServices()
        self.recomendCampaigns = getRecomendCampaigns()
        self.eventCampaigns = getEventCampaigns()
    }
}


