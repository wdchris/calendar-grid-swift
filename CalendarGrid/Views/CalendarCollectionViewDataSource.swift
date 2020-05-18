//
//  CalendarCollectionViewDataSource.swift
//
//  Created by Chris Harding
//

import UIKit

class CalendarCollectionViewDataSource : NSObject, UICollectionViewDataSource {

	private var calendarRange: [CalendarRange] = []

	init(calendarRange: [CalendarRange]) {
		super.init()

		self.calendarRange = calendarRange
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return calendarRange.count
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return calendarRange[section].daysInMonth
	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

		switch kind {
		case UICollectionView.elementKindSectionHeader:

			let section = calendarRange[indexPath.section]
			let date = CalendarManager.getDate(year: section.year, month: section.month)
			let header = CalendarHeader.dequeue(from: collectionView, at: indexPath, forDate: date)

			return header
		default:
			fatalError("Invalid element type")
		}
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let section = calendarRange[indexPath.section]
		let daysInSection = section.daysInMonth
		let day = daysInSection - indexPath.item

		let cell = CalendarCell.dequeue(from: collectionView, at: indexPath, forDay: day)

		return cell
	}
}
