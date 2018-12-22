//
//  EmailHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 22/12/2018.
//
//  TV: Peep Show - Season 4 - Episode 1

import Foundation
import SwiftSMTP

public class EmailHandler {

    private let fromEmail: Mail.User
    private let client: SMTP

    public init(config: EmailConfig) {
        self.fromEmail = Mail.User(name: config.emailName, email: config.emailAccount)
        self.client = SMTP(
            hostname: config.hostName,
            email: config.emailAccount,
            password: config.password
        )
    }

    public func sendMail(
        coreUser: String,
        subject: String,
        emailList: [String] = [],
        content: String = "",
        attachments: [Attachment] = []
    ) {

        let waitTask = DispatchSemaphore(value: 0)

        let to = convertToUsers([coreUser])
        let bcc = convertToUsers(emailList)

        let mail = Mail(
            from: self.fromEmail,
            to: to,
            bcc: bcc,
            subject: subject,
            text: content
        )

        self.client.send(mail) { (error) in
            if let error = error {
                print(error)
            }
            waitTask.signal()
        }
        waitTask.wait()
    }

    private func convertToUsers(_ users: [String]) -> [Mail.User] {
        return users.map{ Mail.User(email: $0) }
    }

}

