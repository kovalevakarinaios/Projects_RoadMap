//
//  DataModel.swift
//  Exercise9_TableAndCollectionView
//
//  Created by Karina Kovaleva on 2.08.23.
//

import Foundation

class DataModel {
    
    static let shared = DataModel()

    private let names = ["Donald", "Jack", "Sean", "Raymond", "Stephen", "Ernest", "Jeffrey", "Michael", "James", "Maurice", "Dennis", "Christopher", "Charles", "Kyle", "Mike", "John", "Arthur", "Terrence", "Charles", "John", "Robert", "Jerry", "Mike", "Thomas", "Gerald", "Louis", "Todd", "George", "Barry", "Jason"]
    private let surnames = ["Graham", "Bailey", "Kelly", "Schmidt", "Rodriguez", "Fisher", "Shaw", "Hill", "Watson", "Miller", "Smith", "Jones", "Pierce", "Price", "Davis", "Bryan", "Martin", "Smith", "Rose", "May", "Rice", "Simmons", "Brown", "Sanders", "Torres", "Turner", "Williams", "Johnson", "Bradley", "Hammond"]
    private let desriptions = ["Whoso loves, believes the impossible.", "The truest greatness lies in being kind, the truest wisdom in a happy mind.", "Any of us can achieve virtue, if by virtue we merely mean the avoidance of the vices that do not attract us.", "Tomatoes make great weapons when water balloons aren’t available.", "Beware of the half truth. You may have gotten hold of the wrong half.", "The truth is that you pay for your lifestyle in hours.", "Obstacles are those things you see when you take your eyes off the goal.", "His ultimate dream fantasy consisted of being content and sleeping eight hours in a row.", "Fate is in your hands and no one elses", "If you can't explain it simply, you don't understand it well enough.", "Peace begins with a smile.", "Happiness does not come about only due to external circumstances; it mainly derives from inner attitudes.", "The beauty of the African sunset disguised the danger lurking nearby.", "The undertaking of a new action brings new strength.", "When nobody is around, the trees gossip about the people who have walked under them.", "It must be five o'clock somewhere.", "As time wore on, simple dog commands turned into full paragraphs explaining why the dog couldn’t do something.", "The difficulties of life are intended to make us better, not bitter.", "You have no right to call yourself creative until you look at a trowel and think that it would make a great lockpick.", "Truth is powerful and it prevails.", "Poison ivy grew through the fence they said was impenetrable.", "Deep listening is miraculous for both listener and speaker.When someone receives us with open-hearted, non-judging, intensely interested listening, our spirits expand.", "The book is in front of the table.", "What we think, we become.", "You can't trust without risk but neither can you live in a cocoon.", "Constant kindness can accomplish much. As the sun makes ice melt, kindness causes misunderstanding, mistrust, and hostility to evaporate.", "We are all something, but none of us are everything.", "Holding on to anger is like grasping a hot coal with the intent of throwing it at someone else; you are the one who gets burned.", "To fly, we have to have resistance.", "All action results from thought, so it is thoughts that matter."]
    
    private var users = [User]()
    
    private init() {
        self.users = self.createThirtyUsers()
    }
    
    private func createThirtyUsers() -> [User] {
        var users = [User]()
        for n in 0...names.count - 1 {
            users.append(User(firstName: self.names[n],
                              lastName: self.surnames[n],
                              age: UInt.random(in: 18...80),
                              sex: Sex.allCases.randomElement()!,
                              squareAvatarURL: URL(string: "https://image.cnbcfm.com/api/v1/image/105773423-1551716977818rtx6p9yw.jpg?v=1551717428&w=700&h=700")!,
                              description: self.desriptions[n]))
        }
        return users
    }
    
    public func getUsers() -> [User] {
        self.users
    }
}
