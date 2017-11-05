//
//  DetailViewController.swift
//  SplitUIImage
//
//  Created by Luyen on 11/5/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            scrollView.contentSize = detailImageView.frame.size
            scrollView.minimumZoomScale = 1.0
            scrollView.maximumZoomScale = 5.0
        }
    }
    
    var detailCandy: Candy? {
        didSet {
            configureView()
        }
    }
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailCandy {
            if let labelText = detailDescriptionLabel, let detailImage = detailImageView {
                labelText.text = detail.name
                detailImage.image = UIImage(named: detail.name)
                title = detailCandy?.category
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.detailImageView
    }
}

