/*:
## App Exercise - Activity Challenge
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 Your fitness tracking app shows users a list of possible challenges, grouped by activity type (i.e. walking challenges, running challenges, calisthenics challenges, weightlifting challenges, etc.) A challenge could be as simple as "Walk 3 miles a day" or as intense as "Run 5 times a week." 
 
 Using arrays of type `String`, create at least two lists, one for walking challenges, and one for running challenges. Each should have at least two challenges and should be initialized using an array literal. Feel free to create more lists for different activities.
 */
var walkingChallenges = ["walk 3.1 miles every day", "walk up a big hill"]
var runningChallenges = ["run a mile in under 5 minutes", "run a 5k"]
var calisthenicsChallenges = ["Do a front lever hold for 1 second", "Do handstand pushups 10 times in a row"]

//:  In your app you want to show all of these lists on the same screen grouped into sections. Create a `challenges` array that holds each of the lists you have created (it will be an array of arrays). Using `challenges`, print the first element in the second challenge list.
var challenges: [Array] = [walkingChallenges, runningChallenges, calisthenicsChallenges]
print(challenges[1][0])
//:  All of the challenges will reset at the end of the month. Use the `removeAll` to remove everything from `challenges`. Print `challenges`.
challenges.removeAll()
print(challenges)

//:  Create a new array of type `String` that will represent challenges a user has committed to instead of available challenges. It can be an empty array or have a few items in it.
var commitedChallenges: [String] = []

//:  Write an if statement that will use `isEmpty` to check if there is anything in the array. If there is not, print a statement asking the user to commit to a challenge. Add an else-if statement that will print "The challenge you have chosen is <INSERT CHOSEN CHALLENGE>" if the array count is exactly 1. Then add an else statement that will print "You have chosen multiple challenges."
if commitedChallenges.isEmpty {
    print("""
Hey.
Yes, you. The one reading this message while probably sipping coffee, procrastinating, or pretending to scroll with purpose. I need you to pause for a moment — not just physically, but mentally, emotionally, spiritually, and maybe even metaphysically — and ask yourself one simple question:

What if this is the moment everything changes?

What if this challenge — this seemingly small, possibly ridiculous, definitely intimidating task — is the very thing that flips the switch? The thing that takes you from “I should probably do that someday” to “I did it. I actually did it.”

Now, I know what you’re thinking. You’ve got stuff going on. You’re busy. You’re tired. You’ve got a list of excuses so long it could be published as a trilogy. But here’s the truth: every single person who ever accomplished anything worthwhile started exactly where you are — uncertain, unprepared, and slightly annoyed that someone was calling them out.

This challenge isn’t about perfection. It’s not about being the best. It’s about showing up. It’s about proving to yourself that you can commit, even when it’s inconvenient. It’s about choosing growth over comfort, momentum over stagnation, and action over endless overthinking.

And let’s be honest — you love a good challenge. You thrive on competition. You light up when someone dares you to go further, faster, funnier, smarter. So why not lean into that? Why not take this moment and say, “Screw it. I’m in.”

Because if you don’t, you’ll always wonder. You’ll always have that nagging little voice whispering, “What if you had tried?” And frankly, that voice is annoying. Let’s silence it with action.

So here it is: the challenge is waiting.
It’s not going to beg. It’s not going to chase you. It’s just sitting there, arms crossed, eyebrow raised, saying, “Well? Are you coming or not?”

Say yes. Not because it’s easy. Say yes because you’re the kind of person who does hard things. Say yes because deep down, you know you’re capable of more. Say yes because you’ll regret it if you don’t.

And if you’re still hesitating, let me just say this:
The version of you who finishes this challenge is already proud.
Now go become them.
""")
} else if commitedChallenges.count == 1 {
    print("The challenge you have chosen is \(commitedChallenges[0])")
    
}
    


/*:
[Previous](@previous)  |  page 2 of 4  |  [Next: Exercise - Dictionaries](@next)
 */
