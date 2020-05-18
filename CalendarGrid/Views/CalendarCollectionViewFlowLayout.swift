//
//  CalendarCollectionViewFlowLayout.swift
//
//  Created by Chris Harding
//

import UIKit

class CalendarCollectionViewFlowLayout : UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout {

	var itemsPerRow: CGFloat = 3

	override init() {
		super.init()

		self.configLayout()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)

		self.configLayout()
	}

	func configLayout() {
		itemSize = CGSize(width: 125, height: 125)
		headerReferenceSize = CGSize(width: 0, height: 50)

		sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
		minimumLineSpacing = 1
		minimumInteritemSpacing = 1
	}

	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		guard let flow = collectionViewLayout as? UICollectionViewFlowLayout else {
			fatalError("only flow layout is supported")
		}

		let paddingSpace = flow.sectionInset.left + flow.sectionInset.right + (minimumInteritemSpacing * itemsPerRow)
		let availableWidth = collectionView.frame.width - paddingSpace
		let widthPerItem = availableWidth / itemsPerRow

		return CGSize(width: widthPerItem, height: widthPerItem)
	}

	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		guard let flow = collectionViewLayout as? UICollectionViewFlowLayout else {
			fatalError("only flow layout is supported")
		}

		return flow.sectionInset
	}
}
