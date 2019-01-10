//
//  Apikeys.swift
//  TopGamesSelection
//
//  Created by Sadiya Syeda on 9/10/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

enum ApplicationEnvironment : String{
    case url = "https://api.twitch.tv/"
}

enum EndPoint : String{
    case topGames = "kraken/games/top"
}

enum ApiHeaderKeys : String{
    case clientID = "Client-ID"
}

enum ApiHeaderValues : String{
    case clientIdValue = "nq033i1s4i5vgvu8q9pqot96ugl9dd"
}

enum ApiRequestKeys : String{
    case limit = "limit"
}

enum ApiRequestValues : String{
    case limitValue = "20"
}
