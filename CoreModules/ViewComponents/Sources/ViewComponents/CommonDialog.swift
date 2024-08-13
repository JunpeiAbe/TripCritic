import SwiftUI

enum DialogButtonType {
    case positiveOnly
    case negativeOnly
    case both
}

struct CommonDialog: View {
    
    @Binding var isPresented: Bool
    let iconImage: UIImage?
    let title: String
    let message: String
    var positiveAction: (() -> Void)
    let negativeAction: (() -> Void)
    let buttonType: DialogButtonType
    
    init(
        isPresented: Binding<Bool>,
        iconImage: UIImage? = nil,
        title: String,
        message: String,
        positiveAction: @escaping () -> Void,
        negativeAction: @escaping () -> Void,
        buttonType: DialogButtonType
    ) {
        self._isPresented = isPresented
        self.iconImage = iconImage
        self.title = title
        self.message = message
        self.positiveAction = positiveAction
        self.negativeAction = negativeAction
        self.buttonType = buttonType
    }
    
    var body: some View {
        ZStack {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .animation(.easeOut(duration: 0.8), value: isPresented)
                    .opacity( isPresented ? 1 : 0)
                HStack {
                    VStack(spacing: 16) {
                        if let image = iconImage {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 60,height: 60)
                                .aspectRatio(contentMode: .fit)
                        }
                        Text(self.title)
                            .font(.system(size: 20,weight: .bold))
                        Text(self.message)
                            .font(.system(size: 18,weight: .regular))
                        self.renderButtons()
                    }
                    .padding(.vertical,32)
                    .padding(.horizontal,16)
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 2)
                .padding(.horizontal,16)
                .opacity(isPresented ? 1 : 0)
                .offset(y: isPresented ? 0 : UIScreen.main.bounds.height)
                .transition(.move(edge: .bottom))
                .animation(.easeOut(duration: 0.2), value: isPresented)
        }
    }
    @ViewBuilder
        private func renderButtons() -> some View {
            switch buttonType {
            case .positiveOnly:
                createButton(title: "OK", action: positiveAction)
                
            case .negativeOnly:
                createButton(title: "Cancel", action: negativeAction, foregroundColor: .black, backgroundColor: .gray.opacity(0.2))
                
            case .both:
                VStack(spacing: 8) {
                    createButton(title: "OK", action: positiveAction)
                    createButton(title: "Cancel", action: negativeAction, foregroundColor: .black, backgroundColor: .gray.opacity(0.2))
                }
            }
        }
        
    private func createButton(title: String, action: @escaping () -> Void, foregroundColor: Color = .white, backgroundColor: Color = .blue) -> some View {
        CommonButton(
            title: title,
            font: .system(size: 18, weight: .bold),
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            cornerRadius: 10,
            isEnabled: .constant(true),
            action: {
                action()
                self.isPresented = false
            }
        )
        .buttonStyle(DarkenButtonStyle())
        .frame(height: 48)
    }
}

#Preview {
    CommonDialog(
        isPresented: .constant(true),
        iconImage: .strokedCheckmark,
        title: "タイトル",
        message: "メッセージ",
        positiveAction: {},
        negativeAction: {}, 
        buttonType: .both
    )
}
