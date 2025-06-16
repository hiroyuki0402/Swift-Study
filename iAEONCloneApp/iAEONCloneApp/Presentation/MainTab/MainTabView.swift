import SwiftUI

struct MainTabView: View {
    @State private var viewModel: MainTabViewModel = .init()

    var body: some View {

        TabView(selection: $viewModel.selectedTab) {
            ForEach(MainTab.allCases) { tab in
                Tab(tab.title, systemImage: tab.imageResource, value: tab) {
                    NavigationStack {
                        currentView(for: tab)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func currentView(for tab: MainTab) -> some View {
        switch tab {
        case .home:
            HomeView()
        case .campaigns:
            CampaignsView()
        case .middle:
            MMiddleView()
        case .productsearch:
            ProductsearchView()
        case .mypage:
            MypageView()
        }
    }
}

#Preview {
    MainTabView()
}
