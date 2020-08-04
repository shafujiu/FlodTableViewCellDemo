//
//  ViewController.swift
//  FlodTableViewCellDemo
//
//  Created by Shafujiu on 2020/8/4.
//  Copyright © 2020 Shafujiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cellId = "SFJFlodCell"
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    }
    
    
}

