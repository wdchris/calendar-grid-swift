//
//  ViewController.swift
//
//  Created by Chris Harding
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var contentView: UIView!

	private var startDate: Date = CalendarManager.getDate(year: 2020, month: 01)
	private var endDate: Date = Date()

	override func viewDidLoad() {
		super.viewDidLoad()

		contentView.addSubview(collectionView)
		collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
	}

	lazy var collectionView: UICollectionView = {
		let layout = collectionViewFlowLayout
		let collectionView = UICollectionView(frame: self.contentView.frame, collectionViewLayout: layout)

		collectionView.dataSource = self.collectionViewDataSource
		collectionView.delegate = self.collectionViewFlowLayout

		CalendarCell.register(with: collectionView)
		CalendarHeader.register(with: collectionView)

		collectionView.backgroundColor = UIColor.white
		collectionView.translatesAutoresizingMaskIntoConstraints = false

		return collectionView
	}()

	lazy var collectionViewFlowLayout : CalendarCollectionViewFlowLayout = {
        let layout = CalendarCollectionViewFlowLayout()
        return layout
    }()

	lazy var collectionViewDataSource: CalendarCollectionViewDataSource = {
		let range = CalendarManager.getCalendarRange(withStartDate: startDate, withEndDate: endDate)
		let collectionView = CalendarCollectionViewDataSource(calendarRange: range)
		return collectionView
	}()
}
