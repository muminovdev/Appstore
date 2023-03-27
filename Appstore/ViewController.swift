//
//  ViewController.swift
//  Appstore
//
//  Created by Mac on 25/03/23.
//

import UIKit

class ViewController: UIViewController {
    let data = [
        Genaral(label: "What we are playing",
                cells:[
                    Model(img: "1", text: "Seekers Notes", subText: "find clues"),
                    Model(img: "2", text: "Words of Wonders", subText: "cross & Connect"),
                    Model(img: "3", text: "Stagelands-eternal defense", subText: "Defend land, build protection"),
                    Model(img: "4", text: "the ants: Underground kingdom", subText: "welcome to the ants"),
                    Model(img: "5", text: "f1 clash-car racing manager", subText: "formula 1 race simulator 2022"),
                    Model(img: "6", text: "Hungry shark world", subText: "Endless hunt, eat to survive")
                ]),
        Genaral(label: "Must-play games",
                cells: [
                    Model(img: "11", text: "PUBG mobile", subText: "Top battle royale mobile game"),
                    Model(img: "12", text: "Mobile legands:bang bang", subText: "Play with the world"),
                    Model(img: "13", text: "Miecraft", subText: "Create, ecplore"),
                    Model(img: "14", text: "Call of duty", subText: "Multiplayer, FPS"),
                    Model(img: "15", text: "Yalla ludo-Ludo&Domino", subText: "Popular ludo"),
                    Model(img: "16", text: "POkwmon GO", subText: "Epic AR adbenture"),
                    
                ])
    ]
    let collectionView: UICollectionView = {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.55), heightDimension: .fractionalHeight(1)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
         
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.img.image = UIImage(named: data[indexPath.section].cells[indexPath.row].img)
        cell.title.text = data[indexPath.section].cells[indexPath.row].text
        cell.label.text = data[indexPath.section].cells[indexPath.row].subText
        return cell
    }
    
    
}


