import SwiftUI

struct CommonSelectionView: View {
    @Binding var isPresented: Bool
    @Binding var options: [SelectOption]
    /// 選択状態を一時保存するための配列
    @State private var temporaryOptions: [SelectOption]
    var isApplyButtonEnabled: Bool {
        self.temporaryOptions.contains { $0.isSelected }
    }
    let title: String
    let positiveAction: (() -> Void)
    let negativeAction: (() -> Void)
    
    init(
        isPresented: Binding<Bool>,
        options: Binding<[SelectOption]>,
        title: String,
        positiveAction: @escaping () -> Void,
        negativeAction: @escaping () -> Void
    ) {
        self._isPresented = isPresented
        self._options = options
        self._temporaryOptions = State(initialValue: options.wrappedValue)
        self.title = title
        self.positiveAction = positiveAction
        self.negativeAction = negativeAction
    }
    
    var body: some View {
        VStack {
            /// タイトル
            HStack {
                Text(self.title)
                    .font(.system(size: 20,weight: .semibold))
                Spacer()
            }
            VStack {
                /// 選択一覧
                ScrollView {
                    VStack(spacing:10) {
                        ForEach(self.temporaryOptions) { option in
                            CommonButton(
                                title: option.title,
                                font: .system(size: 18,weight: .bold),
                                backgroundColor: option.isSelected 
                                ? .red
                                : .gray.opacity(0.5),
                                cornerRadius:10,
                                isEnabled: .constant(true)
                            ) {
                                self.selectOption(option)
                            }
                            .frame(height: 48)
                            .buttonStyle(DarkenButtonStyle())
                        }
                    }
                }
                
                HStack {
                    /// applyボタン
                    CommonButton(
                        title: "Apply",
                        font: .system(size: 18,weight: .bold),
                        cornerRadius: 10,
                        isEnabled: .constant(self.isApplyButtonEnabled)
                    ) {
                        self.applySelection()
                        self.isPresented = false
                        self.positiveAction()
                    }
                    .frame(height: 48)
                    .buttonStyle(DarkenButtonStyle())
                    /// Cancelボタン
                    CommonButton(
                        title: "Cancel",
                        font: .system(size: 18,weight: .bold),
                        foregroundColor: .black,
                        backgroundColor: .gray.opacity(0.2),
                        cornerRadius:10,
                        isEnabled: .constant(true)
                    ) {
                        self.isPresented = false
                        self.negativeAction()
                    }
                    .frame(height: 48)
                    .buttonStyle(DarkenButtonStyle())
                }
            }
        }
        .padding(16)
        //.presentationDetents([.medium])
    }
    
    private func selectOption(_ selectedOption: SelectOption) {
        temporaryOptions.indices.forEach { index in
            temporaryOptions[index].isSelected = (temporaryOptions[index].id == selectedOption.id)
        }
    }
    private func applySelection() {
        /// 一時保存した選択肢を保存
        self.options = temporaryOptions
    }
    private func cancelSelection() {}
}

#Preview {
    CommonSelectionView(
        isPresented: .constant(true),
        options:
                .constant(
                    [
                        .init(
                            title: "会社員",
                            isSelected: false
                        ),
                        .init(
                            title: "経営者",
                            isSelected: false
                        ),
                        .init(
                            title: "無職",
                            isSelected: false
                        ),
                        .init(
                            title: "会社員",
                            isSelected: false
                        ),
                        .init(
                            title: "経営者",
                            isSelected: false
                        ),
                        .init(
                            title: "無職",
                            isSelected: false
                        ),
                        .init(
                            title: "会社員",
                            isSelected: false
                        ),
                        .init(
                            title: "経営者",
                            isSelected: false
                        ),
                        .init(
                            title: "無職",
                            isSelected: false
                        ),
                        
                        
                    ]
                ), 
        title: "職業",
        positiveAction: {},
        negativeAction: {}
    )
}

struct SelectOption: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    var isSelected: Bool = false
}
