//
//  ViewController.swift
//  MemoryGame
//
//  Created by Afnan Theb on 16/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource  {
    
    
    var imgeCardArr = [
        UIImage(named: "moon1"),
        UIImage(named: "moon1") ,
        UIImage(named: "bee1") ,
        UIImage(named: "bee1") ,
        UIImage(named: "green1") ,
        UIImage(named: "green1") ,
        UIImage(named: "brid1") ,
        UIImage(named: "bird1") ,
        UIImage(named: "star1") ,
        UIImage(named: "star1") ,
        UIImage(named: "cake1") ,
        UIImage(named: "cake1") ,
        UIImage(named: "parrot1") ,
        UIImage(named: "parrot1") ,
        UIImage(named: "sweat1"),
        UIImage(named: "sweat1")]
    
    
    //     timer ----------------
    @IBOutlet weak var timerLable: UILabel!
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    //  -------------   func delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgeCardArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardID", for: indexPath) as! ImagesCards
        cell.images.image = imgeCardArr[indexPath.row ]
        return cell
    }
    //    ---------------
    
    
    
    var lastSelectedIndex : Int?
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cellObject = collectionView.cellForItem(at: indexPath) as! ImagesCards
        print("selected image: \(cellObject.images.image)")
        print("prev image: \(imgeCardArr[indexPath.row])")
        if lastSelectedIndex != nil  {
            if (imgeCardArr[lastSelectedIndex!] == cellObject.images.image && lastSelectedIndex != indexPath.row) {
                imgeCardArr.remove(at: lastSelectedIndex!)
                imgeCardArr.remove(at: indexPath.row)
                print("Matched")
                lastSelectedIndex = nil
            }
        } else {
            print("Keep going")
            lastSelectedIndex = indexPath.row
        }
        collectionView.reloadData()
        print("Last index: \(lastSelectedIndex), current Index: \(indexPath.row)")

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ImagesCards", bundle: nil), forCellWithReuseIdentifier: "cardID")
        
        
        
    }
    
    
    //    func createTimer (){
    //        let timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(time), userInfo: nil, repeats: false)
    //    }
    //
    //
    //    @objc func time (){
    //
    //        view.backgroundColor = .systemRed
    //    }
    //
    
    
    
    
    
    
}



//    func login(enteredUsernsme: String, enteredpassword: String){
//        if username == enteredUsernsme && password == enteredpassword {
//
//        }
//    }

//}

