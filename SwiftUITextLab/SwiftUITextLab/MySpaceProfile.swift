//
//  MySpaceProfile.swift
//  SwiftUITextLab
//
//  Created by Jane Madsen on 9/10/25.
//

import SwiftUI

/*
 ## Instructions:
 Your goal is to create an app that will serve as social media profile. Use Text view modifiers to arrange and style your profile to reflect your unique style.
 
 Since this assignment will require you to choose custom fonts, you may want to open the Font Book app installed on your Mac, where you can view a list of the fonts available on Mac and iOS by default.
 
 If you would like to change the background color of each of these views, you can do so by changing the colors listed in each #Preview macro at the bottom of the page.
 
 1. Create three structs that conform to View: ProfileView, TopFiveFriendsView, and BlogPostView. This will fix the errors
 2. To see a preview of how each view will look in the app, make sure you have opened your canvas (Option + Command + Return). You can view each struct you've created by clicking on the tabs at the top of the canvas.
 3. Create a profile view with Text elements for each of the following items: Username, Real Name, Home City, and Bio. Style each of them appropriately with custom fonts, font sizes, and colors for each. Feel free to add any additional modifiers as well.
 4. Create a TopFiveFriends view with a list of your friends, ranked in order of favorite to least favorite. (Don't worry, we won't tell them). Use a different font and color for each person, and include an Emoji to represent each one as well.
 5. Create a BlogPostView. Write a long blog post. Give your blog post a title, a date posted, a body, and a display of number of likes and comments. Once again, style each individually with fonts, font sizes, and colors, and any other modifiers you would like.
 6. Try running the app. You should see all three views embedded in Tabs (the code for this is in SwiftUITextLabApp.swift). You may need to adjust the style slightly to accommodate the Tab Bar at the bottom of the screen.
 
 ## Black Diamond
 
 7. Add one or more Image views to each page.
 8. Use Stack views to arrange your content more dynamically.
 
 ## Rubric
 
 - App has a profile view with Username, Real Name, Home City, and Bio, appropriately filled out and styled.
 - App has a Top Five Friends screen with emoji, fonts, and colors for each friend.
 - App has a blog post view with a title, a date posted, a body, and a number of likes and comments. All are styled, sized, and colored appropriately.
 */

struct ProfileView: View {
    @State private var isExpanded: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading, spacing: 16) {
                Text("JoeIsCool")
                    .font(.custom("Kohinoor Telugu", size: 60))
                    .foregroundColor(.blue)

                Text("Joseph Wright")
                    .font(.custom("Kohinoor Telugu", size: 24))
                    .foregroundColor(.gray)
                    .padding(.top, -20)

                Text("Alpine, Utah")
                    .font(.custom("Kohinoor Telugu", size: 18))
                    .foregroundColor(.gray)
                    .padding(.top, -20)

                Group {
                    Text("Joseph Wright is a resident of Alpine, Utah. He engages in a variety of routine activities and maintains a consistent schedule. His interests include standard recreational pursuits and general social interaction. He values structure, reliability, and conventional approaches to problem-solving. His demeanor is calm, and his conduct is appropriate in both professional and casual settings.")
                        .font(.custom("Georgia", size: 16))
                        .lineLimit(isExpanded ? nil : 3)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                        .animation(.easeInOut(duration: 0.4), value: isExpanded)


                    Button(isExpanded ? "Close Bio" : "Expand Bio") {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            isExpanded.toggle()
                        }
                    }
                    .font(.custom("Menlo", size: 16))
                    .foregroundStyle(.blue)
                    .grayscale(0.7)
                    .padding(.top, -12)
                }
            }
            .padding(.top, 40)
            .padding(.leading, 45)
            .padding(.trailing, 20)
            .onAppear() {
                print(UIFont.familyNames)
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct TopFiveFriendsView: View {
    var body: some View {
        VStack() {
            Text("Top Five Friends")
                .font(.custom("Kohinoor Gujarati", size: 40))
                .tint(.indigo)
                .underline(true)
            VStack(spacing: 5) {
                Text("Pizza 🍕")
                    .foregroundColor(.red)
                    .font(.custom("Kohinoor Gujarati", size: 40))
                Text("Popcorn 🍿")
                    .foregroundColor(.orange)
                    .font(.custom("Rockwell", size: 35))
                Text("Steak 🥩")
                    .foregroundColor(.yellow)
                    .font(.custom("Symbol", size: 30))
                Text("Ice Cream 🍨")
                    .foregroundColor(.green)
                    .font(.custom("Thonburi", size: 25))
                Text("Pickles 🥒")
                    .foregroundColor(.blue)
                    .font(.custom("Kohinoor Gujarati", size: 20))
            }
        }
        .offset(x: 0, y: -100)
    }
}

struct BlogPostView: View {
    var body: some View {
        Text("The Magic in the Mundane: Why Small Moments Matter")
            .font(.custom("Thonburi", size: 40))
            .offset(x: 0, y: -50)
            .foregroundStyle(.blue)
            .padding(5)
        Text("10/10/2007")
            .padding(-10)
            .offset(x: -120, y: 0)
        Text("We live in a world that glorifies the big wins—graduations, promotions, weddings, viral fame. But what if the real magic lies in the moments we overlook? The quiet cup of coffee before the world wakes up. The unexpected smile from a stranger. The way sunlight hits your desk just right. These tiny slices of life often slip past us unnoticed, yet they shape our days more than we realize.")
            .padding(10)
            .font(.custom("Mukta Mahee", size: 20))
        HStack(spacing: 120) {
            Text("10 ❤️")
            Text("67 💬")
        }
        .font(.custom("Papyrus", size: 30))
    }
}

#Preview("ProfileView") {
    ProfileView()
        .background(.white)
}

#Preview("TopFiveFriendsView") {
    TopFiveFriendsView()
        .background(.white)
}

#Preview("BlogPostView") {
    BlogPostView()
        .background(.white)
}
