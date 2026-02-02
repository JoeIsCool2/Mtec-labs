//
//  ViewController.swift
//  UIKitPlay
//
//  Created by joseph wright on 1/21/26.
//

import UIKit

class ViewController: UIViewController {
    let loseYourself = [
      "Look", "If", "you", "had", "one", "shot", "or", "one", "opportunity",
      "To", "seize", "everything", "you", "ever", "wanted", "one", "moment",
      "Would", "you", "capture", "it", "Or", "just", "let", "it", "slip",
      "Yo", "His", "palms", "are", "sweaty", "knees", "weak", "arms", "are", "heavy",
      "Theres", "vomit", "on", "his", "sweater", "already", "moms", "spaghetti",
      "Hes", "nervous", "but", "on", "the", "surface", "he", "looks", "calm", "and", "ready",
      "to", "drops", "bombs", "but", "he", "keeps", "on", "forgetting",
      "what", "he", "wrote", "down", "the", "whole", "crowd", "goes", "so", "loud",
      "He", "opens", "his", "mouth", "but", "the", "words", "wont", "come", "out",
      "Hes", "chokin", "how", "Everybodys", "jokin", "now",
      "The", "clocks", "run", "out", "times", "up", "over", "BLAOW",
      "Snap", "back", "to", "reality", "OHH", "there", "goes", "gravity",
      "OHH", "there", "goes", "Rabbit", "he", "choked",
      "Hes", "so", "mad", "but", "he", "wont",
      "Give", "up", "that", "easy", "nope", "he", "wont", "have", "it",
      "He", "knows", "his", "whole", "backs", "to", "these", "ropes",
      "It", "dont", "matter", "hes", "dope",
      "He", "knows", "that", "but", "hes", "broke",
      "Hes", "so", "sad", "that", "he", "knows",
      "when", "he", "goes", "back", "to", "this", "mobile", "home", "thats", "when", "its",
      "back", "to", "the", "lab", "again", "yo", "this", "whole", "rap", "shift",
      "He", "better", "go", "capture", "this", "moment", "and", "hope", "it", "dont", "pass", "him",
      "You", "better", "lose", "yourself", "in", "the", "music", "the", "moment",
      "You", "own", "it", "you", "better", "never", "let", "it", "go", "go",
      "You", "only", "get", "one", "shot", "do", "not", "miss", "your", "chance", "to", "blow",
      "This", "opportunity", "comes", "once", "in", "a", "lifetime",
      "You", "better", "lose", "yourself", "in", "the", "music", "the", "moment",
      "You", "own", "it", "you", "better", "never", "let", "it", "go", "go",
      "You", "only", "get", "one", "shot", "do", "not", "miss", "your", "chance", "to", "blow",
      "This", "opportunity", "comes", "once", "in", "a", "lifetime",
      "You", "better", "Souls", "escaping", "through", "this", "hole", "that", "is", "gaping",
      "This", "world", "is", "mine", "for", "the", "taking",
      "Make", "me", "king", "as", "we", "move", "toward", "a", "new", "world", "order",
      "A", "normal", "life", "is", "boring", "but", "superstardoms",
      "close", "to", "post-mortem", "it", "only", "grows", "harder",
      "Homie", "grows", "hotter", "he", "blows", "its", "all", "over",
      "These", "hoes", "is", "all", "on", "him", "coast", "to", "coast", "shows",
      "Hes", "known", "as", "the", "Globetrotter",
      "Lonely", "roads", "God", "only", "knows",
      "Hes", "grown", "farther", "from", "home", "hes", "no", "father",
      "He", "goes", "home", "and", "barely", "knows", "his", "own", "daughter",
      "But", "hold", "your", "nose", "cause", "here", "goes", "the", "cold", "water",
      "These", "hoes", "dont", "want", "him", "no", "mo", "hes", "cold", "product",
      "They", "moved", "on", "to", "the", "next", "schmoe", "who", "flows",
      "He", "nose-dove", "and", "sold", "nada", "and", "so", "the", "soap", "opera",
      "is", "told", "it", "unfolds", "I", "suppose", "its", "old", "partner",
      "But", "the", "beat", "goes", "on", "da-da-dum", "da-dum", "da-dah",
      "You", "better", "lose", "yourself", "in", "the", "music", "the", "moment",
      "You", "own", "it", "you", "better", "never", "let", "it", "go", "go",
      "You", "only", "get", "one", "shot", "do", "not", "miss", "your", "chance", "to", "blow",
      "This", "opportunity", "comes", "once", "in", "a", "lifetime",
      "You", "better", "lose", "yourself", "in", "the", "music", "the", "moment",
      "You", "own", "it", "you", "better", "never", "let", "it", "go", "go",
      "You", "only", "get", "one", "shot", "do", "not", "miss", "your", "chance", "to", "blow",
      "This", "opportunity", "comes", "once", "in", "a", "lifetime",
      "You", "better", "No", "more", "games", "Imma", "change", "what", "you", "call", "rage",
      "Tear", "this", "motherfuckin", "roof", "off", "like", "two", "dogs", "caged",
      "I", "was", "playin", "in", "the", "beginning", "the", "mood", "all", "changed",
      "Ive", "been", "chewed", "up", "and", "spit", "out", "and", "booed", "off", "stage",
      "But", "I", "kept", "rhymin", "and", "stepped", "right", "in", "the", "next", "cypher",
      "Best", "believe", "somebodys", "payin", "the", "pied", "piper",
      "All", "the", "pain", "inside", "amplified", "by", "the",
      "fact", "that", "I", "cant", "get", "by", "with", "my", "nine", "to",
      "five", "and", "I", "cant", "provide", "the", "right", "type", "of",
      "life", "for", "my", "family", "cause", "man", "these", "God", "damn",
      "food", "stamps", "dont", "buy", "diapers", "and", "theres", "no", "movie",
      "Theres", "no", "Mekhi", "Phifer", "this", "is", "my", "life",
      "And", "these", "times", "are", "so", "hard", "and", "its", "gettin", "even", "harder",
      "Tryin", "to", "feed", "and", "water", "my", "seed", "plus", "teeter-totter",
      "Caught", "up", "between", "bein", "a", "father", "and", "a", "pre-madonna",
      "Baby", "momma", "drama", "screamin", "on", "her", "too", "much", "for", "me", "to", "wanna",
      "stay", "in", "one", "spot", "another", "day", "of", "monotony",
      "has", "gotten", "me", "to", "the", "point", "Im", "like", "a", "snail", "Ive", "got",
      "to", "formulate", "a", "plot", "or", "end", "up", "in", "jail", "or", "shot",
      "Success", "is", "my", "only", "motherfuckin", "option", "failures", "not",
      "Mom", "I", "love", "you", "but", "this", "trailers", "got", "to", "go",
      "I", "cannot", "grow", "old", "in", "Salems", "Lot",
      "So", "here", "I", "go", "its", "my", "shot", "feet", "fail", "me", "not",
      "This", "may", "be", "the", "only", "opportunity", "that", "I", "got",
      "You", "better", "lose", "yourself", "in", "the", "music", "the", "moment",
      "You", "own", "it", "you", "better", "never", "let", "it", "go", "go",
      "You", "only", "get", "one", "shot", "do", "not", "miss", "your", "chance", "to", "blow",
      "This", "opportunity", "comes", "once", "in", "a", "lifetime",
      "You", "better", "lose", "yourself", "in", "the", "music", "the", "moment",
      "You", "own", "it", "you", "better", "never", "let", "it", "go", "go",
      "You", "only", "get", "one", "shot", "do", "not", "miss", "your", "chance", "to", "blow",
      "This", "opportunity", "comes", "once", "in", "a", "lifetime",
      "You", "better", "You", "can", "do", "anything", "you", "set", "your", "mind", "to", "man"
    ]
    var currentLyric = 0
    
    @IBOutlet weak var NextWord: UIButton!
    @IBOutlet weak var LooseYourselfLyrics: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LooseYourselfLyrics.text = loseYourself[currentLyric]
    }
    
    @IBAction func NextWord(_ sender: Any) {
        currentLyric = 1
    }
}

