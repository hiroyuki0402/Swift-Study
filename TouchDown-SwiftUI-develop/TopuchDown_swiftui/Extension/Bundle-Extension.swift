//
//  Bundle-Extension.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/30.
//

import Foundation

import Foundation

extension Bundle {

    /// JSONファイルを指定された型のインスタンスにデコード
    ///
    /// このメソッドを使用して、ファイルからJSONデータを読み込み、`Decodable` プロトコルに準拠するオブジェクトにデコード
    /// デコードまたはファイルの取得が失敗した場合、このメソッドは `nil` を返す
    ///
    /// - Parameters:
    ///   - file: JSONデータを含むファイルの名前(拡張子は不要)
    ///   - type: JSONデータからデコードするオブジェクトの型
    ///
    /// - Returns: 指定された型のインスタンス(デコードが失敗した場合は `nil` )
    ///
    /// - 例:
    ///   ```
    ///   if let user = Bundle.main.decode("user", type: User.self) {
    ///       print(user.name)
    ///   }
    ///   ```

    func decode<T: Decodable>(_ file: String?, type: T.Type) -> T? {
        /// 指定されたファイル名を使用して、バンドル内のリソースのURLを取得し、
        /// そのURLからデータを読み取り、どちらも成功しない場合はnilを返す
        guard let url = self.url(forResource: file, withExtension: nil), let data = try? Data(contentsOf: url) else {
            return nil
        }

        /// 取得したデータを指定された型にデコードしてデコードに失敗すると、
        /// 次の処理へ進む前にnilを返す
        let decoder = try? JSONDecoder().decode(type.self, from: data)
        return decoder
    }
}
