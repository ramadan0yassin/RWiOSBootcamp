//
//  MediaPostsDataSource.swift
//  Birdie
//
//  Created by Franklin Byaruhanga on 29/06/2020.
//  Copyright © 2020 Jay Strawn. All rights reserved.
//

import UIKit

class MediaPostsDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MediaPostsHandler.shared.mediaPosts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mediaPost = MediaPostsHandler.shared.mediaPosts[indexPath.row]
        let cell = MediaPostsCellCoordinator.shared.configureCell(for: mediaPost, in: tableView)
        cell.backgroundView = UIView(backgroundColor: .white)
        cell.backgroundView?.addSeparator()

        cell.selectedBackgroundView = UIView(backgroundColor: .lightGray)
        cell.selectedBackgroundView?.addSeparator()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

private extension UIView {
    convenience init(backgroundColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
    }

    func addSeparator() {
        let separatorHeight: CGFloat = 2
        let frame = CGRect(x: 0, y: bounds.height - separatorHeight, width: bounds.width, height: separatorHeight)
        let separator = UIView(frame: frame)
        separator.backgroundColor = .gray
        separator.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]

        addSubview(separator)
    }
}
