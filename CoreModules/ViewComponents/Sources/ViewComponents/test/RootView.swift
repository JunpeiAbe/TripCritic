import Foundation
import SwiftUI

public struct RootView: View {
    
    public init() {}
    
    public var body: some View {
        ParentView()
    }
}

public protocol NavigationProtocol: View {
    var router: NavigationRouter { get }
}

// NavigationRouterとViewIDの定義
public class NavigationRouter: ObservableObject {
    @Published var path: [Screen] = []
    
    public init() {}
    
    /// 遷移先を定義
    enum Screen: Hashable {
        case parent
        case childA
        case childB
        case childC
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


