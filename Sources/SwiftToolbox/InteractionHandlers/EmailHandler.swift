//
//  EmailHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 22/12/2018.
//
//  TV: Peep Show - Season 4 - Episode 1

import Foundation

import struct SwiftSMTP.SMTP
import struct SwiftSMTP.Mail
import struct SwiftSMTP.Attachment

public class EmailHandler {

    private let fromEmail: Mail.User
    private let client: SMTP

    /**
     Email Handler initialiser

     - parameter config: The config to drive setting up an email client
     */
    public init(config: EmailConfig) {
        self.fromEmail = Mail.User(
            name: config.emailName,
            email: config.emailAccount
        )

        self.client = SMTP(
            hostname: config.hostName,
            email: config.emailAccount,
            password: config.password
        )
    }

    /**
     Responsible for sending emails

     - parameter coreUser: The main recipient of the email
     - parameter subject: The subject of the email
     - parameter emailList: An email list to include in the BCC
     - parameter content: The string content of the email
     - parameter imageAttachmentUrls: An array of image URLs to include as attachments
     */
    public func sendMail(
        coreUser: String,
        subject: String,
        emailList: [String] = [],
        content: String = "",
        imageAttachmentUrls: [String] = []
    ) {

        let waitTask = DispatchSemaphore(value: 0)
        let to = convertToUsers([coreUser])
        let bcc = convertToUsers(emailList)

        let attachments = createImageAttachments(imageAttachmentUrls)

        let mail = Mail(
            from: self.fromEmail,
            to: to,
            bcc: bcc,
            subject: subject,
            text: content,
            attachments: attachments
        )

        self.client.send(mail) { (error) in
            if let error = error {
                print(error)
            }
            waitTask.signal()
        }
        waitTask.wait()
    }

    /**
     Responsible for converting strings to Mail users

     - parameter users: An array of email addresses to create users from

     - returns: An array of mail users
     */
    private func convertToUsers(_ users: [String]) -> [Mail.User] {
        return users.map{ Mail.User(email: $0) }
    }

    /**
     Responsible for creating image attachments from an array of URLs

     - parameter imageUrls: An array of image URLs to convert to HTML attachments

     - returns: An array of mail attachments
     */
    public func createImageAttachments(_ imageUrls: [String]) -> [Attachment] {
        return imageUrls.map({
            Attachment(htmlContent: "<img src=\"\($0)\"/>")
        })
    }

}

