//
//  TestData.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/24.
//

import Foundation
import SwiftUI
import Firebase

class TestData{

    static let shared = TestData()
    let bannerItems = ["bannerItem", "bannerItem2", "bannerItem3", "bannerItem4", "bannerItem5", "bannerItem6"]
    let reservation = ["reservation1", "reservation2", "reservation3", "reservation4", "reservation5"]
    let osechiItems = ["Osechi", "Osechi2", "Osechi3", "Osechi4", "Osechi5"]
    let couponItems = ["coupon", "coupon2", "coupon3", "coupon4", "coupon5", "coupon6", "coupon7", "coupon8"]
    let campaignItems = ["campaign", "campaign2", "campaign3"]
    let newItems = ["newItem", "newItem2", "newItem3", "newItem4", "newItem5", "newItem6", "newItem7", "newItem8", "newItem9", "newItem"]
    let othersItems: [OthersItem] = [
        .init(imageName: "storefront", title: "店舗検索"),
        .init(imageName: "smartphone", title: "スマホレジ"),
        .init(imageName: "takeoutbag.and.cup.and.straw", title: "アプリ予約"),
        .init(imageName: "dollarsign", title: "ATMなど"),
        .init(imageName: "poweroutlet.type.f.fill", title: "チャットで質問"),
        .init(imageName: "character.bubble.ar", title: "お客様の声から"),
    ]
    let otokuItems = ["otoku", "otoku2", "otoku3", "otoku4"]
    let serviceItems = ["service", "service3", "service4", "service5", "service6", "service7", "service8", "service9"]
    let partTimeItems = ["partTime", "partTime2", "partTime3"]
    let pickupsItems = ["service9", "reservation5", "campaign3", "otoku4"]
    let noticeItems = ["notice", "notice2", "notice3"]

    let couponData: CouponDatas = [
//        .init(id: "coupon001", image: "coupon", releaseDate: "2023-12-01", title: "コーヒー(M)", kbn: 0, discount: 20, endDate: "2023-12-20"),
//        .init(id: "coupon002", image: "coupon2", releaseDate: "2023-12-02", title: "もっちりとした白いたい焼き　カスタード", kbn: 0, discount: 20, endDate: "2023-12-20"),
//        .init(id: "coupon003", image: "coupon3", releaseDate: "2023-12-03", title: "ごま油香る餃子スープ", kbn: 0, discount: 20, endDate: "2023-12-20"),
//        .init(id: "coupon004", image: "coupon4", releaseDate: "2023-12-04", title: "お餅で包んだ苺ケーキ", kbn: 0, discount: 20, endDate: "2023-12-20"),
//        .init(id: "coupon005", image: "coupon5", releaseDate: "2023-12-05", title: "MILK監修　とろ〜りミルクのクリームコッペ", kbn: 0, discount: 20, endDate: "2023-12-20"),
//        .init(id: "coupon006", image: "coupon6", releaseDate: "2023-12-06", title: "これが炭火焼牛カルビ丼", kbn: 0, discount: 40, endDate: "2023-12-20"),
//        .init(id: "coupon007", image: "coupon7", releaseDate: "2023-12-07", title: "これがロースかつ丼", kbn: 0, discount: 40, endDate: "2023-12-20"),
//        .init(id: "coupon008", image: "coupon8", releaseDate: "2023-12-08", title: "からあげクン　黄金チキン風", kbn: 0, discount: 40, endDate: "2023-12-20"),
//        .init(id: "coupon009", image: "coupon9", releaseDate: "2023-12-08", title: "ゴールドマスター生オフ　350ml", kbn: 1, discount: 40, endDate: "2023-12-20"),
//        .init(id: "coupon010", image: "coupon10", releaseDate: "2023-12-08", title: "さくふわ食感のベルギーワッフル　1個入", kbn: 1, discount: 40, endDate: "2023-12-20"),
//        .init(id: "coupon011", image: "coupon11", releaseDate: "2023-12-08", title: "メガアイスカフェラテ", kbn: 1, discount: 40, endDate: "2023-12-20")
    ]

    let campaignData: CampaignDatas = [
        .init(id: "campaign-001", image: "campaign", url: URL(string: "https://www.lawson.co.jp/lab/campaign/hololive/"), endDate: "2023-12-09", title: "「ホロライブ」キャンペーン オリジナルグッズを手に入れよう！"),
        .init(id: "campaign-002", image: "campaign2", url: URL(string: "https://www.lawson.co.jp/lab/campaign/hypnosismic/"), endDate: "2023-12-31", title: "『ヒプノシスマイク-Division Rap Battle-』Rhyme Anima ＋ キャンペーンオリジナルグッズを手に入れよう！"),
        .init(id: "campaign-003", image: "campaign3", url: URL(string: "https://www.lawson.co.jp/lab/campaign/spyfamily/"), endDate: "2023-12-31", title: "[予告]『劇場版 SPY×FAMILY CODE: White』キャンペーンオリジナルグッズを手に入れよう！")
    ]

    let couponData2: CouponDatas = [
        //  パ
        .init(id: "coupon001", image: "https://www.lawson.co.jp/recommend/original/detail/img/l743902.jpg", type: 0, releaseDate: "2023-12-19", title: "トルティーヤ　ベーコン＆クワトロチーズ", kbn: 0, discount: 30, endDate: "2023-12-24", genre: 1),

        .init(id: "coupon002", image: "https://www.lawson.co.jp/recommend/original/detail/img/l741021.jpg", type: 0, releaseDate: "2023-12-19", title: "チキンカツサンド", kbn: 0, discount: 40, endDate: "2024-12-24", genre: 1),

        .init(id: "coupon003", image: "https://www.lawson.co.jp/recommend/original/detail/img/l745036.jpg", type: 0, releaseDate: "2023-12-19", title: "ピザロール　ダブルウインナー＆チーズソース", kbn: 0, discount: 30, endDate: "2023-12-24", genre: 1),

        .init(id: "coupon004", image: "https://www.lawson.co.jp/recommend/original/detail/img/l740919.jpg", type: 0, releaseDate: "2023-12-19", title: "MILK監修　とろ〜りミルクのクリームコッペ", kbn: 0, discount: 20, endDate: "2024-12-24", genre: 1),

        .init(id: "coupon005", image: "https://www.lawson.co.jp/recommend/original/detail/img/l735881.jpg", type: 0, releaseDate: "2023-12-19", title: "旨いビーフチーズバーガー", kbn: 0, discount: 30, endDate: "2024-12-24", genre: 1),



        // ちゅか
        .init(id: "coupon006", image: "https://www.lawson.co.jp/recommend/original/detail/img/l732458.jpg", type: 0, releaseDate: "2023-12-01", title: "肉の旨みあふれる　ジューシー肉まん", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 3),

        .init(id: "coupon007", image: "https://www.lawson.co.jp/recommend/original/detail/img/l733143.jpg", type: 0, releaseDate: "2023-12-01", title: "特撰肉まん", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 3),

        .init(id: "coupon008", image: "https://www.lawson.co.jp/recommend/original/detail/img/l733783.jpg", type: 0, releaseDate: "2023-12-01", title: "特撰豚まん", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 3),

        .init(id: "coupon009", image: "https://www.lawson.co.jp/recommend/original/detail/img/l732501.jpg", type: 0, releaseDate: "2023-12-01", title: "とろーりチーズとトマトのピザまん", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 3),

        .init(id: "coupon010", image: "https://www.lawson.co.jp/recommend/original/detail/img/l741054.jpg", type: 0, releaseDate: "2023-12-01", title: "バターチキンカレーまん", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 3),

        .init(id: "coupon011", image: "https://www.lawson.co.jp/recommend/original/detail/img/l732503.jpg", type: 0, releaseDate: "2023-12-01", title: "北海道十勝小豆のつぶあんまん", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 3),

        .init(id: "coupon012", image: "https://www.lawson.co.jp/recommend/original/detail/img/l732502.jpg", type: 0, releaseDate: "2023-12-01", title: "北海道十勝小豆のごまあんまん", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 3),


        //弁当
        .init(id: "coupon013", image: "https://www.lawson.co.jp/recommend/original/detail/img/l741446.jpg", type: 0, releaseDate: "2023-12-01", title: "ごはん大盛！チーズメンチ＆唐揚弁当", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 2),

        .init(id: "coupon014", image: "https://www.lawson.co.jp/recommend/original/detail/img/l742229.jpg", type: 0, releaseDate: "2023-12-01", title: "焼ほっけほぐしご飯", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 2),

        .init(id: "coupon015", image: "https://www.lawson.co.jp/recommend/original/detail/img/l743890.jpg", type: 0, releaseDate: "2023-12-01", title: "三陸産鮭使用　焼鮭幕の内", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 2),

        .init(id: "coupon016", image: "https://www.lawson.co.jp/recommend/original/detail/img/l739476.jpg", type: 0, releaseDate: "2023-12-01", title: "ごはん大盛！豚焼肉＆コロッケ弁当", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 2),

        .init(id: "coupon017", image: "https://www.lawson.co.jp/recommend/original/detail/img/l742231.jpg", type: 0, releaseDate: "2023-12-01", title: "三陸産鮭使用　焼鮭のっけ盛り弁当", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 2),

        .init(id: "coupon018", image: "https://www.lawson.co.jp/recommend/original/detail/img/l739474.jpg", type: 0, releaseDate: "2023-12-01", title: "のり弁当", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 2),

        .init(id: "coupon019", image: "https://www.lawson.co.jp/recommend/original/detail/img/l740075.jpg", type: 0, releaseDate: "2023-12-01", title: "おかずいろいろ幕の内", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 2),


        //デザート
        .init(id: "coupon020", image: "https://www.lawson.co.jp/recommend/original/detail/img/l742273.jpg", type: 0, releaseDate: "2023-12-01", title: "こだわりたまごのなめらかプリン", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 4),

        .init(id: "coupon021", image: "https://www.lawson.co.jp/recommend/original/detail/img/l744598.jpg", type: 0, releaseDate: "2023-12-01", title: "ふわどらサンド(プリン＆ホイップ)", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 4),

        .init(id: "coupon022", image: "https://www.lawson.co.jp/recommend/original/detail/img/l744204.jpg", type: 0, releaseDate: "2023-12-01", title: "もっちりとしたカスタードプディング", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 4),

        .init(id: "coupon023", image: "https://www.lawson.co.jp/recommend/original/detail/img/l739829.jpg", type: 0, releaseDate: "2023-12-01", title: "パーティーケーキ　ストロベリーショート　2個", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 4),




        // 麺類
        .init(id: "coupon024", image: "https://www.lawson.co.jp/recommend/original/detail/img/l742294.jpg", type: 0, releaseDate: "2023-12-01", title: "満腹濃厚豚ラーメン", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 5),

        .init(id: "coupon025", image: "https://www.lawson.co.jp/recommend/original/detail/img/l741849.jpg", type: 0, releaseDate: "2023-12-01", title: "神田まつや監修　海老かき揚げそば", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 5),

        .init(id: "coupon026", image: "https://www.lawson.co.jp/recommend/original/detail/img/l737583.jpg", type: 0, releaseDate: "2023-12-01", title: "1食分の野菜が摂れる　ちゃんぽん", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 5),

        .init(id: "coupon028", image: "https://www.lawson.co.jp/recommend/original/detail/img/l737631.jpg", type: 0, releaseDate: "2023-12-01", title: "1食分の野菜が摂れる　あんかけラーメン", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 5),




        //そのとあ
        .init(id: "coupon029", image: "https://www.lawson.co.jp/recommend/original/detail/img/l643077_4.jpg", type: 0, releaseDate: "2023-12-01", title: "重慶飯店監修　大海老のチリソース", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 6),

        .init(id: "coupon030", image: "https://www.lawson.co.jp/recommend/original/detail/img/l694454_1.jpg", type: 0, releaseDate: "2023-12-01", title: "重慶飯店監修　大海老のマヨソース", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 6),

        .init(id: "coupon031", image: "https://www.lawson.co.jp/recommend/original/detail/img/l733528.jpg", type: 0, releaseDate: "2023-12-01", title: "なすび亭監修　豚の角煮", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 6),

        .init(id: "coupon032", image: "https://www.lawson.co.jp/recommend/original/detail/img/l733533.jpg", type: 0, releaseDate: "2023-12-01", title: "肉卸小島監修　牛すじ煮込", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 6),

        .init(id: "coupon033", image: "https://www.lawson.co.jp/recommend/original/detail/img/l557347_4.jpg", type: 0, releaseDate: "2023-12-01", title: "ミックスサラダ", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 6),

        .init(id: "coupon034", image: "https://www.lawson.co.jp/recommend/original/detail/img/l575780_4.jpg", type: 0, releaseDate: "2023-12-01", title: "コーンミックスサラダ", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 6),

        .init(id: "coupon035", image: "https://www.lawson.co.jp/recommend/original/detail/img/l584824_4.jpg", type: 0, releaseDate: "2023-12-01", title: "大根ミックスサラダ", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 6),


        //会員限定
        .init(id: "coupon036", image: "https://www.lawson.co.jp/recommend/original/detail/img/l744636.jpg", type: 0, releaseDate: "2023-12-01", title: "UHA味覚糖　コグミ　サクラクレパス　袋　60g", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 7),

        .init(id: "coupon037", image: "https://www.lawson.co.jp/recommend/original/detail/img/l740887.jpg", type: 0, releaseDate: "2023-12-01", title: "サンヨー食品　サッポロ一番　博多一双監修　泡系濃厚豚骨ラーメン", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 7),

        .init(id: "coupon038", image: "https://www.lawson.co.jp/recommend/original/detail/img/l742020.jpg", type: 0, releaseDate: "2023-12-01", title: "徳島産業　スプーンで食べる　まるで蜜芋　70g", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 7),

        .init(id: "coupon039", image: "https://www.lawson.co.jp/recommend/original/detail/img/l741391.jpg", type: 0, releaseDate: "2023-12-01", title: "サンガリア　ゼロサワー　アップル　350ml", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 7),



        // １００
        .init(id: "coupon040", image: "https://store100.lawson.co.jp/product/valueline/detail/__icsFiles/afieldfile/2023/12/05/ikidorayaki.jpg", type: 0, releaseDate: "2023-12-01", title: "生どら焼き（芋あん＆芋ホイップ）", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 8),

        .init(id: "coupon041", image: "https://store100.lawson.co.jp/product/valueline/detail/__icsFiles/afieldfile/2023/09/20/dezato_natadekokoyoguruto.jpg", type: 0, releaseDate: "2023-12-01", title: "ナタデココヨーグルトデザート", kbn: 0, discount: 20, endDate: "2024-12-20", genre: 8),

    ]


    func uploadCoupons(_ coupons: CouponDatas) {
        let db = Firestore.firestore()

        let batch = db.batch()

        for coupon in coupons {
            let docRef = db.collection("acquiredCoupons").document(coupon.id)
            batch.setData([
                "id": coupon.id,
                "image": coupon.image,
                "type": coupon.type,
                "releaseDate": coupon.releaseDate,
                "title": coupon.title,
                "kbn": coupon.kbn,
                "discount": coupon.discount,
                "endDate": coupon.endDate,
                "genre": coupon.genre
            ], forDocument: docRef)
        }

        batch.commit() { err in
            if let err = err {
                print("Error writing batch \(err)")
            } else {
                print("Batch write succeeded.")
            }
        }
    }
}


struct OthersItem: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
}


