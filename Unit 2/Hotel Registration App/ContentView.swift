//
//  ContentView.swift
//  Hotel Registration App
//
//  Created by Jane Madsen on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            HotelRegistrationScreen()
        }
    }
}

struct HotelRegistrationScreen: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var doorCode: String = ""
    @State var numberOfGuests: Int = 1
    @State private var lengthOfStay: Int = 1
    @State var nonSmoking: Bool = false
    @State var registrationFee: Double = 0.0
    @State var submitted: Bool = false
    @State var checkInDay: Int = 1
    @State var checkOutDay: Int = 1
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    let days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    @State private var checkInMonthIndex = 0
    @State private var checkOutMonthIndex = 0
    @State private var selectedColor: Color = .text
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.background, .white], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            VStack(spacing: 16) {
                HStack {
                    Image("mountainlandLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Mountainland Inn")
                        .font(.custom("Verdana", size: 30))
                        .bold()
                        .foregroundStyle(Color.background)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.highlight)
                        }
                }
                if submitted { Spacer() }
                if !submitted {
                    VStack {
                        TextField("First Name", text: $firstName)
                            .modifier(EnterData())
                        TextField("Last Name", text: $lastName)
                            .modifier(EnterData())
                        SecureField("Door Code", text: $doorCode)
                            .modifier(EnterData())
                        HStack {
                            Text("Number Of Guests:                                 ")
                            Picker("Number Of Guests", selection: $numberOfGuests) {
                                ForEach(1...100, id: \.self) { number in
                                    Text("\(number)").tag(number)
                                }
                            }
                            .tint(.text)
                        }
                        .frame(width: .infinity)
                        .modifier(Solid())
                        //                        Stepper("Length of Stay: \(lengthOfStay) Nights", value: $lengthOfStay, in: 1...31)
                        //                            .modifier(MainStyle())
                        //                            .padding()
                        HStack {
                            Text("Check In                                ")
                            Picker("Select Month", selection: $checkInMonthIndex) {
                                ForEach(0..<months.count, id: \.self) { index in
                                    Text(months[index])
                                }
                            }
                            Picker("\(checkInDay)", selection: $checkInDay) {
                                ForEach(1...31, id: \.self) { checkInDay in
                                    Text("\(checkInDay)").tag(checkInDay)
                                    
                                    
                                }
                            }
                        }
                        .modifier(Solid())
                        HStack {
                            Text("Check Out                              ")
                            Picker("Select Month", selection: $checkOutMonthIndex) {
                                ForEach(0..<months.count, id: \.self) { index in
                                    Text(months[index])
                                }
                            }
                            Picker("\(checkOutDay)", selection: $checkOutDay) {
                                ForEach(1...31, id: \.self) { checkInDay in
                                    Text("\(checkInDay)").tag(checkInDay)
                                }
                            }
                        }
                        .modifier(Solid())
                        ColorPicker("What Color of Pillows", selection: $selectedColor)
                            .modifier(Solid())
                        Toggle("Non-Smoking", isOn: $nonSmoking)
                            .modifier(Solid())
                            .tint(.text)
                    }
                }
                if submitted {
                    Button("Unsubmit") {
                        submitted.toggle()
                    }
                    .modifier(Solid())
                    
                } else {
                    Button("Submit") {
                        submitted.toggle()
                    }
                    .modifier(Solid())
                }
            }
        }
        if submitted {
            let checkInTotal = days.prefix(checkInMonthIndex).reduce(0, +) + checkInDay
            let checkOutTotal = days.prefix(checkOutMonthIndex).reduce(0, +) + checkOutDay
            let lengthOfStay = max(checkOutTotal - checkInTotal, 0)
            VStack {
                Text("Enjoy Your \(lengthOfStay) Night Stay")
                    .modifier(Solid())
                VStack {
                    Text("Thank you for booking with us! How would you rate your experience?")
                    HStack {
                        Text("\(Int(registrationFee))/5")
                        Slider(value: $registrationFee, in: 1...5 )
                    }
                    .tint(.text)
                }
                .modifier(Solid())
            }
        }
    }
}


#Preview {
    ContentView()
}

