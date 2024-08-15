import SwiftUI

struct ModalsView: View {
    @State var isShowModal: Bool = false
    @State var isShowDialog: Bool = false
    @State var options: [SelectOption] = [
        .init(
            title: "会社員"
        ),
        .init(
            title: "経営者"
        ),
        .init(
            title: "無職"
        ),
        .init(
            title: "会社員"
        ),
        .init(
            title: "経営者"
        ),
        .init(
            title: "無職"
        ),
        .init(
            title: "会社員"
        ),
        .init(
            title: "経営者"
        ),
        .init(
            title: "無職"
        )
    ]
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                CommonButton(title: "ダイアログ表示", isEnabled: .constant(true)) {
                    isShowDialog = true
                }
                .padding(.horizontal,16)
                .frame(height: 48)
                .buttonStyle(DarkenButtonStyle())
                
                CommonButton(title: "モーダル表示", isEnabled: .constant(true)) {
                    isShowModal = true
                }
                .padding(.horizontal,16)
                .frame(height: 48)
                .buttonStyle(DarkenButtonStyle())
                .sheet(isPresented: $isShowModal) {
                    CommonSelectionView(
                        isPresented: $isShowModal,
                        options: $options,
                        title: "職業",
                        positiveAction: {},
                        negativeAction: {}
                    )
                }
            }
            CommonDialog(
                isPresented: $isShowDialog,
                title: "テスト",
                message: "テスト",
                positiveAction: {},
                negativeAction: {},
                buttonType: .both
            )
        }
    }
}

#Preview {
    ModalsView()
}
