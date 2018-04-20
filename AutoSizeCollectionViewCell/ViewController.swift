//
//  ViewController.swift
//  AutoSizeCollectionViewCell
//
//  Created by Alex Lee on 2018-04-20.
//  Copyright © 2018 Alex Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let cellIdentifier = "cell"
    private lazy var dataSource: [String] = {
        var dataSource: [String] = []
        dataSource.append("Let’s say you have ")
        dataSource.append("Let’s say you have a constraint that says the width of your UILabel should be equal to 2/3 the width of your cell’s contentView. This means that you have to know the width of one in order to know the width of the other. Either you can:")
        dataSource.append("Let’s say you have a constraint that says the width of your UILabel should be equal to 2/3 the ")
        dataSource.append("Let’s say you have a constraint that says the width of your UILabel ")
        dataSource.append("Let’s say you have a constraint that says the width of your UILabel should be equal to 2/3 the width of your cell’s contentView. This means that you have")
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        let nib = UINib(nibName: "FileNoteCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! FileNoteCollectionViewCell
        cell.noteLabel.text = dataSource[indexPath.item]
        
        return cell
    }
}

