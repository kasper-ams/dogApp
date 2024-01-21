//
//  ItemData.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/12/2023.
//

import Foundation


struct ItemStructure: Identifiable, Codable, Equatable {
    let id: Int
    let title: String?
    let description: String?
    let summary: String?
    let image: String?

    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case summary
        case image
    }
    
    static func ==(lhs: ItemStructure, rhs: ItemStructure) -> Bool {
        return lhs.id == rhs.id
    }
    
    func presentSheet() -> ContentSheetTemplate {
            return ContentSheetTemplate(item: self)
        }
}

struct ItemArray: Codable {
    let items: [ItemStructure]
    let total, skip, limit: Int
}

class ItemListViewModel: ObservableObject {
    
    @Published var commands: [ItemStructure] = ItemDatabase.commands
    @Published var tricks: [ItemStructure] = ItemDatabase.tricks
    @Published var games: [ItemStructure] = ItemDatabase.games


    init() {
        self.commands = ItemDatabase.commands
        self.tricks = ItemDatabase.tricks
        self.games = ItemDatabase.games
    }
}

final class ItemDatabase {
    static let items: [ItemStructure] = [
        
        ItemStructure(id: 1, title: "Sit", description: "• Hold a treat close to your dog's nose. Move your hand upwards, causing their head to follow the treat. \n \n  • As their head moves up, their bottom will naturally lower into a sitting position. \n \n • Once they are sitting, say \"Sit\" and give them the treat.", summary: nil, image: "Sit"),
        ItemStructure(id: 2, title: "Stay", description: "• Ask your dog to sit or lie down. \n \n • Hold your palm out towards them, like a stop sign. \n \n • Take a step back, and if they remain in place, say \"Stay\" and reward them with a treat. \n \n • Gradually increase the distance and duration over time.", summary: nil, image: "Stay"),
        ItemStructure(id: 3, title: "Lie down", description: "• Start with your dog in a sitting position. \n \n • Hold a treat close to their nose, then move your hand downwards to the ground. \n \n • As they follow the treat, their body will lower to the ground. Once they are lying down, say \"Down\" and reward them.", summary: nil, image: "LieDown"),
        ItemStructure(id: 4, title: "Leave it", description: "• Grab some tasty treats and your dog's leash (just in case). \n \n • Show your pup a treat, let them sniff it, but keep it hidden in your hand. \n \n • With a grin, say \"Leave It\" in a clear, friendly tone. \n \n • Wait for your dog to back off from your hand (even if it's just a little bit). The moment they do, give 'em a cheer, \"Good dog!\" \n \n • Now, surprise them with a different treat from your other hand as a reward. \n \n • Practice, making it a bit tougher each time. Try with treats on the ground or more tempting items. \n \n • Use \"Leave It\" during walks when they spot something interesting, and keep them safe. \n \n • Keep it upbeat and celebrate their successes. Your dog will be a \"Leave It\" pro in no time!", summary: nil, image: "LeaveIt"),
        ItemStructure(id: 5, title: "Recall", description: "• Have some delicious treats ready. Something your dog can't resist! \n \n • Call your dog's name followed by \"Come\" in a happy voice, like \"Buddy, come!\" \n \n • When they come to you, immediately give them a treat and shower them with praise. Be their biggest fan! \n \n • Sometimes, make it a game! After they come, play with a toy or have a short play session. Keep practicing, and they'll come running every time you call. \n \n Remember, keep it enjoyable for your furry friend, and coming to you will be their favorite thing to do!", summary: "Whenever you want your dog to come to you, use a cheerful and friendly tone. Be someone they want to hang out with!", image: "Come"),
        ItemStructure(id: 6, title: "Place", description: "• Choose a comfy spot for your dog to stay, like a dog bed or a designated area on the floor. \n \n • You'll need treats and a clicker (optional) for positive reinforcement. \n \n • Using a leash, stand by the chosen spot and say your command, like \"place\" or \"bed.\" \n \n • Use a treat to guide your dog onto the spot. Make sure they're fully on it before rewarding. \n \n • Click (if using a clicker) and treat immediately. Offer verbal praise like \"Good job!\" \n \n • Start waiting a few seconds before rewarding to build patience.", summary: "Teaching your dog to \"go to place\" is a handy command that can make your life easier. Follow these steps.", image: "Place"),
        ItemStructure(id: 7, title: "Hush", description: "Start with the Basics: Choose a quiet, distraction-free spot. \n \n Use the Command: Pick a word like \"quiet\" or \"hush\" and say it calmly. \n \n Wait for Silence: When your pup stops barking, even for a sec, reward with a treat! \n \n Practice, Practice, Practice: Consistency is key. Repeat until they get the hang of it. \n \n  Extend Quiet Time: Gradually ask for longer moments of silence before treating. \n \n Tip: you can combine it with the \"Bark\" command to practice both Speah and Hush.", summary: "Tired of constant barking? It's time to teach your furry friend to hush on command! Here's how.", image: "Hush"),
        ItemStructure(id: 8, title: "Eye contact", description: "• Choose a simple word or phrase like \"watch me\" or \"look at me\". This will serve as the command you use to instruct your dog to make eye contact with you. \n \n • Hold a treat up near your face to get their attention. \n \n • When you give the cue (e.g., \"watch me\"), wait for your dog to make eye contact with you. As soon as they do, immediately reward them with the treat and offer verbal praise.", summary: "This is a useful command to practice as it reinforces your dog to pay attention to you.", image: "Look"),
        ItemStructure(id: 9, title: "Roll over", description: "• Ask your dog to lie down. \n \n • Hold a treat close to their nose and move it in a circular motion, leading them to roll over. \n \n •  As they roll over, say \"Roll over\" and reward them with the treat.", summary: nil, image: "RollOver"),
        ItemStructure(id: 10, title: "High five", description: "• Start with your dog in a sitting position. \nHold a treat in your hand and raise it slightly above their head. Say \"High five\" and gently tap one of their front paws. \n \n • When they raise their paw to reach for the treat, give it to them and praise them.", summary: nil, image: "HighFive"),
        ItemStructure(id: 11, title: "Jump into arms", description: "• Start by picking a fun and catchy command word like \"Jump\" or \"Hop on.\" \n \n • Grab a low bench, step, or anything sturdy that's about the height of your dog's paws. Nothing too fancy, just something they can easily jump onto. \n \n • Hold a tasty treat or your dog's favorite toy above their head, a little out of reach. Give your command word with a smile, like \"Jump!\" or \"Hop up!\" \n \n • As your pup leaps onto the surface, catch them gently with open arms and a big grin. Then, let the praise flow – \"Good job, you're amazing!\" – and give them treats and cuddles. \n \n • Once they've got the hang of it, make it more exciting! Try higher surfaces, and remember, keep the party vibe going. The higher they jump, the more cheers and treats they get! \n \n • Training your dog should be fun for both of you, so keep it light and enjoyable. If they need a break or aren't getting it right away, no worries – just try again later. Happy jumping!", summary: "Training your dog to jump into your arms can be a cute and affectionate trick. However, it's important to ensure your dog's safety and comfort during this training process. Here's a step-by-step guide to teach your dog to jump into your arms.", image: "JumpInArms"),
        ItemStructure(id: 12, title: "Play dead", description: "• Begin with your dog in the \"down\" position. If your dog doesn't already know this command, you can use a treat to lure them into a lying-down position. Hold a treat close to their nose and slowly lower it to the ground, prompting them to follow it and lie down. Once they are in the down position, reward them with the treat. \n \n • With your dog in the down position, use a verbal cue like \"bang,\" \"play dead,\" or any word or phrase you prefer. Simultaneously, use a hand gesture, like pointing your finger at them like a gun. Be consistent with your chosen cue and gesture. \n \n • Gently encourage your dog to roll onto their side by lightly pressing on their shoulder or hip, depending on which side you want them to play dead on. At the same time, maintain the \"bang\" command and the hand gesture. \n \n • As soon as your dog is lying on their side, reward them with a treat and plenty of praise. Use a happy and excited tone of voice to let them know they did a fantastic job. \n \n • Practice this trick regularly in short training sessions. Be patient, and remember that some dogs may take longer to grasp the concept than others. Consistency and positive reinforcement are essential. \n \nAs your dog becomes more comfortable with the \"play dead\" trick, you can refine it by extending the time they stay in the down position before rewarding them. Gradually, you can work on having them stay in the position for longer durations.", summary: "Before you start teaching \"play dead,\" your dog should already know basic commands like \"sit,\" \"down,\" and \"stay.\" If your dog is not familiar with these commands, it's a good idea to work on them first, as they will be the foundation for the \"play dead\" trick.", image: "playDead"),
        ItemStructure(id: 13, title: "Bark on command", description: "• Get your dog's attention with their favorite snacks. Make sure you have them handy. \n \n • Choose a word like \"speak\" or \"bark.\" This is what you'll say when you want your pup to bark. \n \n • Say your chosen word, like \"speak,\" in a cheerful voice. Your dog might give you a weird look at first, but that's okay. \n \n • Be patient. Your dog might not get it right away. But as soon as they bark—even if it's just a little woof—give them a treat and lots of praise. They'll figure out that barking when you say \"speak\" gets them treats and love. \n \n • Practice this a bunch of times. Keep saying \"speak,\" and when your dog barks, reward them. They'll catch on with some practice. \n \n • Once your pup gets the hang of it, try making them bark for a bit longer before giving them a treat. This helps them understand that they should keep barking until you say \"enough\" or whatever word you want to use to stop them.", summary: "Teaching your dog to bark on command is kinda like having your own little alarm system. Here's how you can do it.", image: "bark"),
        ItemStructure(id: 14, title: "Peek", description: "• Start with your dog in front of you, and hold a treat or toy between your legs. \n \n • Pick a word like \"peek\" or \"through\" to signal the action. \n \n • Encourage your pup to reach for the treat or toy by gently moving it back and forth between your legs. \n \n • The moment they peek through, celebrate! Treats and enthusiastic praise are a must. \n \nPractice makes perfect, so keep at it until they nail the trick.", summary: "Want to impress your friends with your dog's adorable antics? Here's how to teach them to peek through the legs.", image: "Peek"),
        ItemStructure(id: 15, title: "Crawl", description: "• Start with command \"down\" in a quiet place. \n \n • Hold a treat close to their nose, but don't let them have it just yet. \n \n • Use a cue like \"crawl\" or \"sneak\" (or any fun word you like), and slowly move the treat along the ground, just out of their reach. \n \n • As they follow the treat, they'll naturally start to crawl When they do, reward them with the treat and lots of praise!", summary: nil, image: "Crawl"),
        ItemStructure(id: 16, title: "Spin", description: "• Stand in front of your dog and hold a treat near the nose. \n \n • Guide them in a circle with the treat. \n \n • Add a command like \"spin.\" \n \n • Reward and praise when they complete the spin. \n \n • Practice both clockwise and counterclockwise spins.", summary: nil, image: "Spin"),
        ItemStructure(id: 17, title: "Fetch", description: "• Start with a favorite toy or ball. \n \n • Toss the toy a short distance. \n \n • Encourage your dog to go after it by saying \"Fetch\" or using their name. \n \n • When they retrieve the toy, praise them and offer a treat.", summary: nil, image: "Fetch"),
        ItemStructure(id: 18, title: "Hide and seek", description: "• Start in a room where your dog can't see you, like behind a closed door or around a corner. \n \n • Tell your pup to \"sit\" or \"stay\" while you prepare for your epic hide-and-seek mission. Make sure they're ready for action! \n \n • While your dog's on standby, find the perfect hiding spot in your house or yard. Start with easy-peasy spots like behind the couch or in an open closet. Later, you can up the ante with some expert-level hiding places! \n \n • Now, with the enthusiasm level cranked up to 11, call your dog using your best secret agent voice. Try something like, \"Come find me, Super Pup!\" or \"Where's the treat treasure, detective dog?\" \n \n • Your furry detective will put their super sniffing skills to work. They'll follow the scent trail you left behind and embark on the ultimate quest to find you. Stay cool and quiet in your hidey-hole. \n \n • When your trusty sidekick finally busts you, it's time to celebrate! Shower them with praise, treats, and a victory dance. They're officially the Hide-and-Seek Champion of the Universe!", summary: "Dogs love this game because it engages their natural hunting and tracking instincts while providing mental stimulation and exercise. Here's how to play!", image: "hideAndSeek"),
        ItemStructure(id: 19, title: "Tug of war", description: "Tug of war is a super fun game for pups who love a bit of roughhousing! \n \nGrab a strong rope or a special tug toy just for dogs, and let's get this paw-some party started! \n \nBut first, let's set some basic rules, like a cool command to kick off the game and another to call it quits. This way, your furry friend knows when it's time to get their tug on. \n \nOh, and don't forget, keep an eye on the action to make sure everyone's having a blast safely. We wouldn't want things to get too rowdy! ", summary: nil, image: "Tug"),
        ItemStructure(id: 20, title: "Catch frisbee", description: "• Get a soft frisbee made for dogs. They're easier on their mouths. \n \n •  Show your dog the frisbee and get them all excited about it. Make it look like the coolest thing ever. \n \n • Begin with short, gentle throws close to your dog. Let them see it in the air and catch it. Praise them like crazy when they do! \n \n • Keep tossing the frisbee a bit farther each time as your pup gets better. \n \n • Reward them with treats and praise when they catch it. Dogs love treats, and it makes them want to catch that frisbee even more. \n \n • Some dogs catch on quick, and some take a bit longer. Be patient and keep the practice sessions fun. \n \n • Watch out for sharp turns and hard landings, especially on concrete or asphalt. Dogs can hurt themselves if they're not careful.", summary: nil, image: "frisbee"),
        ItemStructure(id: 21, title: "Treasure hunt", description: "• Start with a treat or toy that your dog loves. This will be the \"treasure\" they're searching for. \n \n • Let your dog see the treat or toy, so they know what they're looking for. Make sure they're excited about it. \n \n • At first, hide the treasure somewhere easy for your dog to find, like behind a cushion or under a blanket. \n \n • Use a cue word like \"find it\" while your dog watches you hide the treasure. \n \n • Encourage your dog to search by pointing or showing interest in the hidden spot. You can even use your excited voice to say, \"Where's the treasure?\" \n \n • When your dog finds the treasure, celebrate! Praise them and give them the treat or toy as a reward. \n \n • As your dog gets better at finding hidden treasures, make the game more challenging. Hide the treasure in different rooms or under more complex hiding spots.", summary: nil, image: "treasureHunt"),
        ItemStructure(id: 22, title: "Tunnel", description: "• Allow your dog to explore the tunnel and encourage them with treats. \n \n • Show a treat and toss it into the tunnel to entice your dog. \n \n • If needed, use a leash to guide them through, rewarding at the end. \n \n • Train in short, positive sessions. Add a command like \"tunnel\" for consistency. \n \n Over time, make the tunnel longer or introduce more complex routes.", summary: "Depending in the size of the tunnel you may need to practice \"Crawl\" first.", image: "Tunnel"),
        ItemStructure(id: 23, title: "Treat challenge", description: "• Arrange the three cups upside down in a row on the floor. \n \n • Allow your dog to observe as you place a treat under one of the cups. Ensure they see which cup you choose. \n \n • Use a specific command like \"Find it!\" to signal the start of the game. \n \n • Let your dog use their paws or nose to nudge the cups and discover which one hides the treat. They may need some time to figure it out, so be patient. \n \n • When your dog successfully uncovers the treat, celebrate their victory with joyful praise and, of course, the delicious reward.", summary: "This is an engaging way to keep their mind sharp and provide entertainment. In this game, your furry friend will learn to guess which cup hides the treat.", image: "Cups"),
        ItemStructure(id: 24, title: "Volley", description: "• Select a suitable ball or toy for your dog. It should be soft and lightweight to avoid causing any harm if your dog accidentally gets hit or trips while chasing it.\n \n • Begin by tossing the ball gently to your dog. Use an underhand motion to create a soft lob. Encourage your dog to retrieve the ball by saying a cue like \"fetch\" or \"get it.\"\n \n • When your dog picks up the ball, enthusiastically call them back to you. You can use phrase like \"bring it\". Offer positive reinforcement, such as praise or treats, when they return the ball to you.\n \n • Continue to toss the ball to your dog, encouraging them to retrieve it and bring it back to you. Keep the game light-hearted and fun.\n\nPlaying volley with your dog is a great way to exercise, bond, and have fun together. Remember to always prioritize your dog's safety and enjoyment during playtime.", summary: "The goal is to have a great time with your dog while encouraging them to fetch and return the ball to you, creating a playful, volley-like experience.", image: "Volley")
    ]
    
    static let commands: [ItemStructure] = Array(items.prefix(8))
    static let tricks: [ItemStructure] = Array(items[8..<16])
    static let games: [ItemStructure] = Array(items[16..<24])


    
}
