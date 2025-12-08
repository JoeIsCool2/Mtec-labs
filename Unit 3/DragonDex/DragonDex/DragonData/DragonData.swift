import SwiftUI

struct DragonData {
    let dragonData = [
        Dragon(picture: .fireDragon,
               species: "Inferno Drake",
               loreSnippet: "Born from the heart of volcanoes, Inferno Drakes embody raw destruction and rebirth.",
               powers: [
                   Power(type: .elemental, name: "Flame Breath", strength: 5),
                   Power(type: .elemental, name: "Lava Surge", strength: 4),
                   Power(type: .defense, name: "Heat Shield", strength: 3),
                   Power(type: .speed, name: "Blazing Dash", strength: 2),
                   Power(type: .elemental, name: "Ash Storm", strength: 3),
                   Power(type: .control, name: "Scorched Earth", strength: 3),
                   Power(type: .healing, name: "Ember Renewal", strength: 2),
                   Power(type: .elemental, name: "Cinder Burst", strength: 4),
                   Power(type: .camouflage, name: "Smoke Veil", strength: 2),
                   Power(type: .defense, name: "Molten Armor", strength: 4),
                   Power(type: .elemental, name: "Infernal Roar", strength: 3),
                   Power(type: .speed, name: "Eruption Leap", strength: 2)
               ]),

        Dragon(picture: .plantDragon,
               species: "Verdant Serpent",
               loreSnippet: "Guardians of ancient forests, Verdant Serpents weave life and decay in perfect balance.",
               powers: [
                   Power(type: .elemental, name: "Thorn Barrage", strength: 4),
                   Power(type: .healing, name: "Nature’s Renewal", strength: 5),
                   Power(type: .control, name: "Vine Bind", strength: 3),
                   Power(type: .camouflage, name: "Leaf Veil", strength: 2),
                   Power(type: .elemental, name: "Spore Cloud", strength: 3),
                   Power(type: .healing, name: "Barkskin Mend", strength: 2),
                   Power(type: .elemental, name: "Root Spike", strength: 4),
                   Power(type: .defense, name: "Thicket Wall", strength: 3),
                   Power(type: .speed, name: "Ivy Sprint", strength: 2),
                   Power(type: .control, name: "Pollinate Haze", strength: 3),
                   Power(type: .elemental, name: "Bloom Burst", strength: 3),
                   Power(type: .healing, name: "Petal Renewal", strength: 2)
               ]),

        Dragon(picture: .skyDragon,
               species: "Celestial Wyvern",
               loreSnippet: "Said to be born from lightning storms, Celestial Wyverns rule the skies with thunderous might.",
               powers: [
                   Power(type: .elemental, name: "Lightning Strike", strength: 5),
                   Power(type: .speed, name: "Storm Glide", strength: 4),
                   Power(type: .control, name: "Wind Howl", strength: 3),
                   Power(type: .defense, name: "Cloud Cloak", strength: 2),
                   Power(type: .elemental, name: "Thunderclap", strength: 4),
                   Power(type: .healing, name: "Rainfall Rejuvenation", strength: 2),
                   Power(type: .elemental, name: "Tempest Spiral", strength: 3),
                   Power(type: .control, name: "Static Field", strength: 3),
                   Power(type: .speed, name: "Jetstream Dash", strength: 3),
                   Power(type: .elemental, name: "Skyfire Blast", strength: 4),
                   Power(type: .camouflage, name: "Nimbus Veil", strength: 2),
                   Power(type: .defense, name: "Gale Guard", strength: 3)
               ]),

        Dragon(picture: .spaceDragon,
               species: "Cosmos Seraph",
               loreSnippet: "Forged in the void between stars, Cosmos Seraphs bend gravity and light to their will.",
               powers: [
                   Power(type: .elemental, name: "Meteor Shower", strength: 5),
                   Power(type: .control, name: "Gravity Well", strength: 4),
                   Power(type: .illusion, name: "Starlight Mirage", strength: 3),
                   Power(type: .speed, name: "Warp Flight", strength: 5),
                   Power(type: .elemental, name: "Nova Flare", strength: 4),
                   Power(type: .healing, name: "Nebula Renewal", strength: 2),
                   Power(type: .defense, name: "Event Horizon", strength: 4),
                   Power(type: .control, name: "Black Hole Bind", strength: 3),
                   Power(type: .illusion, name: "Photon Veil", strength: 2),
                   Power(type: .elemental, name: "Comet Rush", strength: 4),
                   Power(type: .speed, name: "Lightyear Leap", strength: 3)
               ]),

        Dragon(picture: .toxicDragon,
               species: "Venom Wyrm",
               loreSnippet: "Spawned in swamps of decay, Venom Wyrms thrive on corruption and poison.",
               powers: [
                   Power(type: .elemental, name: "Acid Spit", strength: 4),
                   Power(type: .control, name: "Toxic Fog", strength: 3),
                   Power(type: .defense, name: "Corrosive Scales", strength: 2),
                   Power(type: .speed, name: "Slithering Dash", strength: 1),
                   Power(type: .elemental, name: "Venom Jet", strength: 4),
                   Power(type: .healing, name: "Poison Purge", strength: 2),
                   Power(type: .elemental, name: "Plague Burst", strength: 3),
                   Power(type: .control, name: "Rotting Grasp", strength: 3),
                   Power(type: .defense, name: "Toxic Carapace", strength: 3),
                   Power(type: .camouflage, name: "Mire Meld", strength: 2),
                   Power(type: .elemental, name: "Spore Spray", strength: 3)
               ]),

        Dragon(picture: .waterDragon,
               species: "Abyss Leviathan",
               loreSnippet: "Dwelling in the deepest oceans, Abyss Leviathans command tides and silence with their presence.",
               powers: [
                   Power(type: .elemental, name: "Tidal Wave", strength: 5),
                   Power(type: .control, name: "Whirlpool Trap", strength: 4),
                   Power(type: .healing, name: "Aqua Restoration", strength: 3),
                   Power(type: .speed, name: "Current Surge", strength: 2),
                   Power(type: .elemental, name: "Deep Freeze", strength: 3),
                   Power(type: .control, name: "Pressure Crush", strength: 3),
                   Power(type: .defense, name: "Coral Armor", strength: 2),
                   Power(type: .elemental, name: "Salt Spray", strength: 4),
                   Power(type: .camouflage, name: "Mist Veil", strength: 2),
                   Power(type: .speed, name: "Tide Skim", strength: 3),
                   Power(type: .healing, name: "Brine Cleanse", strength: 2),
                   Power(type: .elemental, name: "Maelstrom Fury", strength: 4)
               ])

    ]
}
