//
//  UICollectionView+Gears.swift
//  Gears
//
//  Created by Candid Cod3r on 5/13/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

extension UICollectionView {

    /**
     Index path of last item in collectionView.
     */
    public var lastIndexPath: IndexPath? {
        return lastIndexPath(in: lastSection)
    }

    /**
     Index of last section in collectionView.
     */
    public var lastSection: Int? {
        return numberOfSections > 0 ? numberOfSections - 1 : nil
    }

    /**
     IndexPath for last item in section.
     */
    public func lastIndexPath(in section: Int?) -> IndexPath? {
        guard let section = section, section >= 0 else {
            return nil
        }

        guard section < numberOfSections else {
            return nil
        }

        let numberOfItems = self.numberOfItems(inSection: section)

        guard numberOfItems > 0 else {
            return nil
        }

        return IndexPath(item: numberOfItems - 1, section: section)
    }

    /**
     Dequeue reusable UICollectionViewCell using class name.
     */
    public func dequeueReusableCell<T: UICollectionViewCell>(_ className: T.Type, for indexPath: IndexPath) -> T {
        let identifier = String(describing: className)
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Cannot dequeue UICollectionViewCell for \(identifier), make sure the cell is registered with collection view")
        }
        return cell
    }

    /**
     Dequeue reusable UICollectionReusableView using class name.
     */
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(_ className: T.Type, ofKind kind: String, for indexPath: IndexPath) -> T {
        let identifier = String(describing: className)
        guard let reusableView = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Cannot dequeue UICollectionReusableView for \(identifier), make sure the view is registered with collection view")
        }
        return reusableView
    }

    /**
     Register UICollectionReusableView using class name.
     */
    public func registerSupplementaryView<T: UICollectionReusableView>(_ className: T.Type, ofKind kind: String) {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: className))
    }

    /**
     Register UICollectionViewCell with class name.
     */
    public func registerCell<T: UICollectionViewCell>(_ className: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: className))
    }

}
