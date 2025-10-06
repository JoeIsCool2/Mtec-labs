import SwiftUI

struct DeviveredOrPickup: View {
    @State var isDelivered = false
    @State var adress: String = ""
    
    var body: some View {
        ZStack {
            Image(.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Button("Pickup") {
                    isDelivered.toggle()
                }
                .toggleStyle(!isDelivered)
                Button("Delivery") {
                    isDelivered.toggle()
                }
                .toggleStyle(isDelivered)
                
                if isDelivered {
                    TextField("Enter Adress", text: $adress)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .font(.custom("Futura", size: 18))
                        .foregroundStyle(Color.black)
                        .background(
                            LinearGradient(colors: [.orangeish], startPoint: .leading, endPoint: .trailing)
                                .clipShape(Capsule())
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color.black, lineWidth: 2) // 🔑 border follows the capsule curve
                        )
                        .padding()
                }
            }
            .padding()
            .navigationTitle("Delivery Options")
        }
    }
}
