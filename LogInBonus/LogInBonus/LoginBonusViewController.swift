import UIKit
import SwiftUI

class LoginBonusViewController: UIViewController {

    // MARK: - IBOutlet

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var gridContainer: UIStackView!

    @IBOutlet weak var gridContainerHeight: NSLayoutConstraint!

    // MARK: - ロジック用プロパティ

    private var consecutiveDays: Int = 0
    private let totalDaysInMonth = Calendar.current.range(of: .day, in: .month, for: Date())?.count ?? 30

    // MARK: - ライフサイクル

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateGrid()
    }

    // MARK: - UI初期化

    private func setupUI() {
        rankLabel.text = "現在のランク: \(currentRank(for: consecutiveDays))"
        testButton.addTarget(self, action: #selector(didTapTestButton), for: .touchUpInside)
    }

    // MARK: - アクション

    @objc private func didTapTestButton() {
        if consecutiveDays < totalDaysInMonth {
            consecutiveDays += 1
            updateGrid()
        }
    }

    // MARK: - スタンプ更新

    private func updateGrid() {
        // 既存の行を削除
        gridContainer.arrangedSubviews.forEach { $0.removeFromSuperview() }

        let columns = 7
        let rows = Int(ceil(Double(totalDaysInMonth) / Double(columns)))

        for row in 0..<rows {
            let rowStack = UIStackView()
            rowStack.axis = .horizontal
            rowStack.alignment = .center
            rowStack.distribution = .fillEqually
            rowStack.spacing = 8
            rowStack.translatesAutoresizingMaskIntoConstraints = false
            rowStack.heightAnchor.constraint(equalToConstant: 44).isActive = true

            for column in 0..<columns {
                let day = row * columns + column + 1
                guard day <= totalDaysInMonth else {
                    let empty = UIView()
                    rowStack.addArrangedSubview(empty)
                    continue
                }

                let container = UIStackView()
                container.axis = .vertical
                container.alignment = .center
                container.spacing = 4
                container.distribution = .fill

                let imageView = UIImageView()
                let isCompleted = day <= consecutiveDays
                let isRankDay = day % 7 == 0

                let rank = rankInfo(for: day)
                imageView.image = UIImage(systemName: isCompleted ? "gift.fill" : "gift")
                imageView.tintColor = isRankDay && isCompleted ? rank.color : (isCompleted ? .systemYellow : .lightGray)
                imageView.contentMode = .scaleAspectFit
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true

                let dayLabel = UILabel()
                dayLabel.text = "Day \(day)"
                dayLabel.font = .systemFont(ofSize: 10)

                container.addArrangedSubview(imageView)
                container.addArrangedSubview(dayLabel)

                if isRankDay {
                    let rankLabel = UILabel()
                    rankLabel.text = rank.label
                    rankLabel.font = .boldSystemFont(ofSize: 10)
                    rankLabel.textColor = rank.color
                    container.addArrangedSubview(rankLabel)
                }

                rowStack.addArrangedSubview(container)
            }

            gridContainer.addArrangedSubview(rowStack)
        }

        // ランク表示更新
        rankLabel.text = "現在のランク: \(currentRank(for: consecutiveDays))"

        let rowHeight: CGFloat = 44
        gridContainerHeight.constant = CGFloat(rows) * rowHeight
    }

    // MARK: - ランク判定

    private func rankInfo(for day: Int) -> (label: String, color: UIColor) {
        switch (day - 1) / 7 {
        case 0: return ("ブロンズ", .brown)
        case 1: return ("シルバー", .gray)
        case 2: return ("ゴールド", .systemYellow)
        default: return ("プラチナ", .systemPurple)
        }
    }

    private func currentRank(for days: Int) -> String {
        return rankInfo(for: days).label
    }
}


struct LoginBonusViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> LoginBonusViewController {
        let storyboard = UIStoryboard(name: "LoginBonusViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "LoginBonusViewController") as? LoginBonusViewController else {
            fatalError("LoginBonusViewController が見つかりません")
        }
        return vc
    }

    func updateUIViewController(_ uiViewController: LoginBonusViewController, context: Context) {
        
    }
}
