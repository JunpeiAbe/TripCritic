import SwiftUI

struct ChildViewC: View, NavigationProtocol {
    @EnvironmentObject var router: NavigationRouter
    var body: some View {
        VStack {
            CommonButton(title: "Parentへ", isEnabled: .constant(true)) {
                router.popToRoot()
                print("パス",router.path)
            }
            .buttonStyle(DarkenButtonStyle())
            .frame(height: 48)
            .padding(16)
            CommonButton(title: "ChildAへ", isEnabled: .constant(true)) {
                router.popTo(.childA)
                print("パス",router.path)
            }
            .buttonStyle(DarkenButtonStyle())
            .frame(height: 48)
            .padding(16)
        }
        .navigationTitle("ChildViewC")
    }
}

//struct ChildViewC_Previews: PreviewProvider {
//    static var previews: some View {
//        ChildViewC()
//            .environmentObject(NavigationRouter())
//    }
//}
