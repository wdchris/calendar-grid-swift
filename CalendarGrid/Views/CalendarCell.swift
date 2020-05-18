//
//  CalendarCell.swift
//
//  Created by Chris Harding
//

import UIKit

class CalendarCell: UICollectionViewCell {

	@IBOutlet weak var dateLabel: UILabel!

	static let identifier = "calendarCell"

	static func register(with collectionView: UICollectionView) {
		collectionView.register(UINib.init(nibName: "CalendarCell", bundle: nil), forCellWithReuseIdentifier: identifier)
	}

	static func dequeue(from collectionView: UICollectionView, at indexPath: IndexPath, forDay day: Int) -> CalendarCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? CalendarCell ?? CalendarCell()

		cell.dateLabel.text = String(format: "%02d", day)

		return cell
	}
}
