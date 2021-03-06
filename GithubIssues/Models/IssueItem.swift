//
//  IssueItem.swift
//  GithubIssues
//
//  Created by Chang Gwi Lee on 2017. 1. 9..
//  Copyright © 2017년 AfreecaTV. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 
 {
 "url": "https://api.github.com/repos/FreeCodeCamp/FreeCodeCamp/issues/12439",
 "repository_url": "https://api.github.com/repos/FreeCodeCamp/FreeCodeCamp",
 "labels_url": "https://api.github.com/repos/FreeCodeCamp/FreeCodeCamp/issues/12439/labels{/name}",
 "comments_url": "https://api.github.com/repos/FreeCodeCamp/FreeCodeCamp/issues/12439/comments",
 "events_url": "https://api.github.com/repos/FreeCodeCamp/FreeCodeCamp/issues/12439/events",
 "html_url": "https://github.com/FreeCodeCamp/FreeCodeCamp/pull/12439",
 "id": 199476262,
 "number": 12439,
 "title": "fix(settings): Lang attribute warnings",
 "user": {
     "login": "BerkeleyTrue",
     "id": 6775919,
     "avatar_url": "https://avatars.githubusercontent.com/u/6775919?v=3",
     "gravatar_id": "",
     "url": "https://api.github.com/users/BerkeleyTrue",
     "html_url": "https://github.com/BerkeleyTrue",
     "followers_url": "https://api.github.com/users/BerkeleyTrue/followers",
     "following_url": "https://api.github.com/users/BerkeleyTrue/following{/other_user}",
     "gists_url": "https://api.github.com/users/BerkeleyTrue/gists{/gist_id}",
     "starred_url": "https://api.github.com/users/BerkeleyTrue/starred{/owner}{/repo}",
     "subscriptions_url": "https://api.github.com/users/BerkeleyTrue/subscriptions",
     "organizations_url": "https://api.github.com/users/BerkeleyTrue/orgs",
     "repos_url": "https://api.github.com/users/BerkeleyTrue/repos",
     "events_url": "https://api.github.com/users/BerkeleyTrue/events{/privacy}",
     "received_events_url": "https://api.github.com/users/BerkeleyTrue/received_events",
     "type": "User",
     "site_admin": false
 },
 "labels": [
     {
         "id": 199856930,
         "url": "https://api.github.com/repos/FreeCodeCamp/FreeCodeCamp/labels/QA",
         "name": "QA",
         "color": "ededed",
         "default": false
     }
 ],
 
 "state": "open",
 "locked": false,
 "assignee": null,
 "assignees": [
 
 ],
 "milestone": null,
 "comments": 0,
 "created_at": "2017-01-09T04:33:59Z",
 "updated_at": "2017-01-09T04:34:03Z",
 "closed_at": null,
 "pull_request": {
     "url": "https://api.github.com/repos/FreeCodeCamp/FreeCodeCamp/pulls/12439",
     "html_url": "https://github.com/FreeCodeCamp/FreeCodeCamp/pull/12439",
     "diff_url": "https://github.com/FreeCodeCamp/FreeCodeCamp/pull/12439.diff",
     "patch_url": "https://github.com/FreeCodeCamp/FreeCodeCamp/pull/12439.patch"
 },
 "body": ""
 }
 
 */

struct IssueItem:ImmutableMappable{
    let url:String
    let repository_url:String
    let id:Int
    let number:Int
    let title:String
    let state:String
    let created_at:Date?
    let body:String
    let comments:Int
    
    let user:IssueItemUser
    
    init(map: Map) throws {
        url = try map.value("url")
        repository_url = try map.value("repository_url")
        id = try map.value("id")
        
        number = try map.value("number")
        title = try map.value("title")
        state = try map.value("state")
        created_at = try? map.value("created_at", using: DateTransform())
        body = try map.value("body")
        comments = try map.value("comments")
        
        user = try map.value("user")
    }
    
    mutating func mapping(map: Map) {
        url >>> map["url"]
        repository_url >>> map["repository_url"]
        id >>> map["id"]
        
        number >>> map["number"]
        title >>> map["title"]
        state >>> map["state"]
        created_at >>> map["created_at"]
        body >>> map["body"]
        comments >>> map["comments"]
        
        user >>> map["user"]
    }
}
