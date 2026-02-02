import Foundation

struct Songs {
    // This splits the string by whitespace and converts the Substrings into an Array of Strings
    let looseYourself = SongLyrics.looseYourselfLyrics.split { $0.isWhitespace }.map(String.init)
    let perfect = SongLyrics.GodsPlanLyrics.split { $0.isWhitespace }.map(String.init)
    
}

class SongLyrics {
    static let looseYourselfLyrics = """
    Look, if you had one shot or one opportunity 
    To seize everything you ever wanted – One moment 
    Would you capture it or just let it slip? 
    His palms are sweaty, knees weak, arms are heavy 
    There’s vomit on his sweater already, mom’s spaghetti 
    He’s nervous, but on the surface he looks calm and ready 
    To drop bombs, but he keeps on forgettin 
    What he wrote down, the whole crowd goes so loud 
    He opens his mouth, but the words won’t come out 
    He’s chokin, how everybody’s jokin now 
    The clock’s run out, time’s up over, blow 
    Snap back to reality, Oh there goes gravity 
    Oh there goes Rabbit, he choked 
    He’s so mad, but he won’t give up that easy no 
    He won’t have it , he knows his whole back’s to these ropes 
    It don’t matter he’s dope, he knows that 
    But he’s broke, he’s so stacked that he knows 
    When he goes back to his mobile home 
    That’s when it’s back to the lab again yo 
    This whole rap shit 
    He better go capture this moment and hope it don’t pass him 
    You better lose yourself in the music, the moment 
    You own it, you better never let it go 
    You only get one shot, do not miss your chance to blow 
    This opportunity comes once in a lifetime yo 
    The soul’s escaping, through this hole that it’s gaping 
    This world is mine for the taking 
    Make me king, as we move toward a new world order 
    A normal life is borin 
    But superstardom’s close to post mortem 
    It only grows harder, only grows hotter 
    He blows us all over these hoes is all on him 
    Coast to coast shows, he’s know as the globetrotter 
    Lonely roads, God only knows 
    He’s grown farther from home, he’s no father 
    He goes home and barely knows his own daughter 
    But hold your nose cause here goes the cold water 
    His hoes don’t want him no mo, he’s cold product 
    They moved on to the next schmoe who flows 
    He nose dove and sold nada 
    So the soap opera is told and unfolds 
    I suppose it’s old partna’ 
    But the beat goes on Da da dum da dum da da 
    No more games I’ma change what you call rage 
    Tear this mothafuckin roof off like 2 dogs caged 
    I was playin in the beginnin the mood all changed 
    I been chewed up and spit out and booed off stage 
    But I kept rhymin and stepwritin the next cypher 
    Best believe somebody’s payin the pied piper 
    All the pain inside amplified by the fact 
    That I can’t get by with my 9 to 5 
    And I can’t provide the right type of life for my family 
    Cause man these goddam food stamps don’t buy diapers 
    And it’s no movie there’s no Mekhi Phifer, this is my life 
    And these times are so hard and it’s getting even harder 
    Tryin to feed and water my seed, plus 
    See dishonor caught up between being a father and a prima donna 
    Baby mama drama’s screamin on and too much for me to wanna 
    Stay in one spot, another day of monotony 
    Has gotten me to the point, I’m like a snail 
    I’ve got to formulate a plot or I’ll end up in jail or shot 
    Success is my only mothafuckin option, failure’s not 
    Mom I love you, but this trailer’s got to go 
    I cannot grow old in Salem’s lot so here I go its my shot 
    Feet fail me not cuz maybe the only opportunity that I got 
    You can do anything you set your mind to man …
    """
    
    static let GodsPlanLyrics = """
    And, they wishin' and wishin' and wishin' and wishin'
    They wishin' on me, yeah
    I been movin' calm, don't start no trouble with me
    Tryna keep it peaceful is a struggle for me
    Don't pull up at 6 AM to cuddle with me
    You know how I like it when you lovin' on me
    I don't wanna die for them to miss me
    Yes, I see the things that they wishin' on me
    Hope I got some brothers that outlive me
    They gon' tell the story, shit was different with me
    God's plan, God's plan
    I hold back, sometimes I won't, yeah
    I feel good, sometimes I don't, ayy, don't
    I finessed down Weston Road, ayy, 'nessed
    Might go down a G-O-D, yeah, wait
    I go hard on Southside G, yeah, Way
    I make sure that north side eat
    And still
    Bad things
    It's a lot of bad things
    That they wishin' and wishin' and wishin' and wishin'
    They wishin' on me
    Bad things
    It's a lot of bad things
    That they wishin' and wishin' and wishin' and wishin'
    They wishin' on me
    Yeah, ayy, ayy (ayy)
    She say, "Do you love me?" I tell her, "Only partly
    I only love my bed and my momma, I'm sorry"
    Fifty Dub, I even got it tatted on me
    81, they'll bring the crashers to the party
    And you know me
    Turn the O2 into the O3, dog
    Without 40, Oli', there'd be no me
    'Magine if I never met the broskis
    God's plan, God's plan
    I can't do this on my own, ayy, no, ayy
    Someone watchin' this shit close, yep, close
    I've been me since Scarlett Road, ayy, road, ayy
    Might go down as G-O-D, yeah, wait
    I go hard on Southside G, ayy, Way
    I make sure that north side eat, yuh
    And still
    Bad things
    It's a lot of bad things
    That they wishin' and wishin' and wishin' and wishin'
    They wishin' on me
    Yeah, yeah
    Bad things
    It's a lot of bad things
    That they wishin' and wishin' and wishin' and wishin'
    They wishin' on me
    Yeah
    """
}
