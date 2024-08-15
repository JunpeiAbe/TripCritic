import SwiftUI

struct ChildViewA: View, NavigationProtocol {
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        VStack {
            CommonButton(title: "ChildBへ", isEnabled: .constant(true)) {
                router.push(.childB)
                print("パス",router.path)
            }
            .buttonStyle(DarkenButtonStyle())
            .frame(height: 48)
            .padding(16)
        }
        .navigationTitle("ChildViewA")
        .onAppear {
            print("ChildAのパス", router.path) // ChildAのパスを確認
        }
    }
}

//struct ChildViewA_Previews: PreviewProvider {
//    static var previews: some View {
//        ChildViewA()
//            .environmentObject(NavigationRouter())
//    }
//}
