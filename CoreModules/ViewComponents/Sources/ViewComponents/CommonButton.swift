import SwiftUI

struct CommonButton: View {
    let image: UIImage?
    let imageSize: CGSize?
    let title: String
    let font: Font
    let foregroundColor: Color
    let backgroundColor: Color
    let disabledBackgroundColor: Color
    let cornerRadius: CGFloat
    let action: () -> Void
    @Binding var isEnabled: Bool
    
    init(
        image: UIImage? = nil,
        imageSize: CGSize? = nil,
        title: String,
        font: Font = .system(size: 16,weight: .regular),
        foregroundColor: Color = .white,
        backgroundColor: Color = .blue,
        disabledBackgroundColor: Color = .gray.opacity(0.5),
        cornerRadius: CGFloat = 2,
        isEnabled : Binding<Bool>,
        action: @escaping () -> Void
    ) {
        self.image = image
        self.imageSize = imageSize
        self.title = title
        self.font = font
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.disabledBackgroundColor = disabledBackgroundColor
        self.cornerRadius = cornerRadius
        self._isEnabled = isEnabled
        self.action = action
    }
    
    var body: some View {
        Button(action: self.action) {
            Label(
                title: {
                    Text(self.title)
                        .font(self.font)
                },
                icon: {
                    if let image = self.image,
                       let imageSize = self.imageSize
                    {
                        Image(uiImage: image)
                            .resizable()
                            .frame(
                                width: imageSize.width,
                                height: imageSize.height
                            )
                            .aspectRatio(contentMode: .fit)
                    }
                }
            )
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .foregroundStyle(self.foregroundColor)
            .background(
                        self.isEnabled
                        ? self.backgroundColor
                        : self.disabledBackgroundColor
            )
            .clipShape(
                RoundedRectangle(cornerRadius: self.cornerRadius)
            )
        }
        .disabled(!self.isEnabled)
    }
}

struct DarkenButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .brightness(configuration.isPressed ? -0.1 : 0.0)  // タップ時に暗くする
    }
}

struct BlightenButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .brightness(configuration.isPressed ? 0.1 : 0.0)  // タップ時に明るくする
    }
}

#Preview {
    CommonButton(
        image:.checkmark,
        imageSize:CGSize(width: 20, height: 20),
        title: "ボタン",
        isEnabled:.constant(true)
    ) {
        print("ボタンタップ")
    }
    .frame(width: 200, height: 60)
    .buttonStyle(DarkenButtonStyle())
    .previewLayout(.sizeThatFits)
}
