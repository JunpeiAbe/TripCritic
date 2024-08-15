import SwiftUI

struct ChildViewB: View, NavigationProtocol {
    @EnvironmentObject var router: NavigationRouter
    var body: some View {
        VStack {
            CommonButton(title: "ChildCへ", isEnabled: .constant(true)) {
                router.push(.childC)
                print("パス",router.path)
            }
            .buttonStyle(DarkenButtonStyle())
            .frame(height: 48)
            .padding(16)
        }
        .navigationTitle("ChildViewB")
    }
}

//struct ChildViewB_Previews: PreviewProvider {
//    static var previews: some View {
//        ChildViewB()
//            .environmentObject(NavigationRouter())
//    }
//}
