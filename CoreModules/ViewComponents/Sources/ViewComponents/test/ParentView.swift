import SwiftUI

struct ParentView: View, NavigationProtocol {
    //@StateObject var router: NavigationRouter = NavigationRouter()
    @EnvironmentObject var router: NavigationRouter
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Text("Parent")
                CommonButton(title: "ChildAへ", isEnabled: .constant(true)) {
                    router.push(.childA)
                    print("パス",router.path)
                }
                .buttonStyle(DarkenButtonStyle())
                .frame(height: 48)
                .padding(16)
            }
            .navigationTitle("Parent")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: NavigationRouter.Screen.self) { destination in
                switch destination {
                case .childA:
                    ChildViewA()
                case .childB:
                    ChildViewB()
                case .childC:
                    ChildViewC()
                default:
                    EmptyView()
                }
            }
            //.environmentObject(router)
        }
    }
}

//struct ParentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ParentView(router: NavigationRouter())
//            .environmentObject(NavigationRouter())
//    }
//}
//
//protocol NavigationProtocol: View {
//    var router: NavigationRouter { get }
//}
//
//// NavigationRouterとViewIDの定義
//class NavigationRouter: ObservableObject {
//    @Published var path: [Screen] = []
//    
//    /// 遷移先を定義
//    enum Screen: Hashable {
//        case parent
//        case childA
//        case childB
//        case childC
//    }
//
//    /// 次画面へ遷移する
//    func push(_ view: Screen) {
//        path.append(view)
//    }
//    
//    /// 遷移先と遷移元に画面を追加する
//    func push(_ views: [Screen]) {
//        path.append(contentsOf: views)
//    }
//
//    /// 前画面に戻る
//    func pop() {
//        path.removeLast()
//    }
//    /// 親画面に戻る
//    func popToRoot() {
//        path.removeAll()
//    }
//
//    /// 任意の画面に戻る
//    func popTo(_ view: Screen) {
//        if let index = path.firstIndex(of: view) {
//            path = Array(path.prefix(upTo: index + 1))
//        }
//    }
//}
//
