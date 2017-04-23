//
//  ExternalResourcesViewController.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/17/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class ExternalResourcesViewController: AppViewController {
    
    struct ExternalResource {
        let name: String
        let info: String
        let address: String
        let imageName: String
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    let externalResources = [
        ExternalResource(
            name: "Planned Parenthood",
            info: "\"We provide up-to-date, clear, medically accurate information that helps you better understand your sexual health.\"",
            address: "https://www.plannedparenthood.org/",
            imageName: "planned_parenthood_logo"),
        ExternalResource(
            name: "Scarleteen",
            info: "\"inclusive, comprehensive, supportive SEXUALITY and RELATIONSHIPS info for teens and emerging adults\"",
            address: "http://www.scarleteen.com/",
            imageName: "scarleteen_logo"),
        ExternalResource(
            name: "Bedsider",
            info: "\"Bedsider.org (Bedsider) is an online birth control support network for women 18-29 operated by The National Campaign to Prevent Teen and Unplanned Pregnancy\"",
            address: "https://www.bedsider.org/",
            imageName: "bedsider_logo"),
        ExternalResource(
            name: "Stay Teen",
            info: "\"[...]encourage you to enjoy your teen years and avoid the responsibilities that come with too-early pregnancy and parenting.\"",
            address: "http://stayteen.org/",
            imageName: "stayteen_logo"),
        ExternalResource(
            name: "Sex, etc.",
            info: "\"We’ve helped teens with answers to their question about sex, relationships, pregnancy, STDs, birth control, sexual orientation and more!\"",
            address: "https://sexetc.org/",
            imageName: "sexetc_logo")
    ]

    func chose(resource: ExternalResource) {
        let url = URL(string: resource.address)!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ExternalResourcesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return externalResources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ExternalResourceCollectionViewCell
        let resource = externalResources[indexPath.row]
        cell.titleLabel?.text = resource.name
        cell.infoTextView?.text = resource.info
        cell.imageView?.image = UIImage(named: resource.imageName)
        return cell
    }
    
}

extension ExternalResourcesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let externalResource = externalResources[indexPath.row]
        chose(resource: externalResource)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
}


