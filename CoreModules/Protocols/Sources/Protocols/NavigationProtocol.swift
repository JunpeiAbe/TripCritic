import SwiftUI
/// Navigation遷移(遷移元、遷移先画面のViewで準拠する)
///  遷移元：@StateObjectでインスタンス化+Viewに.environmentObject(router)で追加, 遷移先：@EnvironmentObject
public protocol NavigationProtocol: View {
    var router: NavigationRouter { get }
}

public class NavigationRouter: ObservableObject {
    /// 遷移の履歴
    @Published var path: [Screen] = []
    
    public init() {}
    
    /// 遷移先を定義
    /// 対応するViewを親のViewで追加
    /// TODO:  初期化に必要なプロパティを関連値で渡す
    enum Screen: Hashable {
//        case parent
//        case childA
//        case childB
//        case childC
    }

    /// 次画面へ遷移する
    func push(_ view: Screen) {
        path.append(view)
    }
    
    /// 遷移先と遷移元に画面を追加する
    func push(_ views: [Screen]) {
        path.append(contentsOf: views)
    }

    /// 前画面に戻る
    func pop() {
        path.removeLast()
    }
    /// 親画面に戻る
    func popToRoot() {
        path.removeAll()
    }

    /// 任意の画面に戻る
    func popTo(_ view: Screen) {
        if let index = path.firstIndex(of: view) {
            path = Array(path.prefix(upTo: index + 1))
        }
    }
}
