import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

class CouponViewModel: ObservableObject {
    @Published var originalCouponDatas: CouponDatas = []
    @Published var coupondatas: CouponDatas = []

    // MARK: - Initializer

    /// ViewModelの初期化。Firestoreからデータを非同期に取得し、ローカルデータもロードする
    init() {
        Task {
            await fetchCouponsFromFirestore()
        }
        loadLocalData()
    }

    // MARK: - Data Loading

    /// ローカルのテストデータをロードする
    private func loadLocalData() {
        originalCouponDatas = TestData.shared.couponData
    }

    /// Firestoreからクーポンデータを非同期に取得する
    @MainActor
    private func fetchCouponsFromFirestore() {
        Task {
            do {
                coupondatas = try await APIManager.shred.fetchFirestoreCollection(fromCollectionPath: "acquiredCoupons", as: CouponData.self)
                print(coupondatas)
            } catch {
                print("Firestoreからのデータ取得エラー: \(error)")
            }
        }
    }

    // MARK: - Data Filtering

    /// 指定されたアイテムタイプに基づいてクーポンをフィルタリングする
    /// - Parameter item: フィルタリングするアイテムタイプ
    /// - Returns: フィルタリングされたクーポンデータの配列
    func getCoupons(item: ItemType) -> CouponDatas {
        // - TODO: 区分の追加
        //coupondatas.filter { $0.kbn == item.rawValue }
        coupondatas
    }

    /// 指定されたインデックスのクーポンデータを取得する
    /// - Parameter index: 取得するクーポンデータのインデックス
    /// - Returns: 指定されたインデックスのクーポンデータ
    func getCouponData(at index: Int) -> CouponData {
        originalCouponDatas[index]
    }

    /// 指定されたジャンルに基づいてクーポンをフィルタリングする
    /// - Parameter genre: フィルタリングするジャンル
    /// - Returns: フィルタリングされたクーポンデータの配列
    func filteredItems(for genre: GenreItem) -> CouponDatas {
        switch genre {
        case .all:
            return coupondatas
        case .pan, .bento, .chukaman, .desert, .men, .others, .currentUser, .ls100:
            return coupondatas.filter { $0.genre == genre.rawValue }
        }
    }
}
