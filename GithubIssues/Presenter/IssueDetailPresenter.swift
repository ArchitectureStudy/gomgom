//
//  IssueDetailPresenter.swift
//  GithubIssues
//
//  Created by Chang Gwi Lee on 2017. 1. 14..
//  Copyright © 2017년 AfreecaTV. All rights reserved.
//

import Foundation

protocol IssueDetailPresenterProtocol {
    func displayDetailIssues(issueItems:IssueDetailItem)
}

class IssueDetailPresenter {
    
    let manager = IssueUserInfoManager.sharedInstance
    
    let model:IssueDetailModel
    var view:IssueDetailPresenterProtocol!
    
    init(view:IssueDetailPresenterProtocol, selectedItem:IssueListItem) {
        self.view = view;
        self.model = IssueDetailModel(user: manager.user, repo: manager.repo, number: selectedItem.number) 
        
        NotificationCenter.default.addObserver(self, selector: #selector(onIssueDetailRequestCompletedNotification(_:)), name: .IssueDetailRequestCompletedNotification, object: nil)
    }
    
    
    @objc func onIssueDetailRequestCompletedNotification(_ notification: Notification) {
        print("onIssueRequestCompletedNotification IN")
        self.view.displayDetailIssues(issueItems: model.issueDetail)
    }
    
    func issuesRequest() {
        // api request
        self.model.request()
    }
    
}
