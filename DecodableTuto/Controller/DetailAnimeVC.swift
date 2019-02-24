//
//  DetailAnimeVC.swift
//  DecodableTuto
//
//  Created by YouSS on 2/23/19.
//  Copyright © 2019 YouSS. All rights reserved.
//

import UIKit

class DetailAnimeVC: UITableViewController {
    
    var anime: Anime?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        title = anime?.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(DetailAnimeCell.self, forCellReuseIdentifier: cellID)
        tableView.register(DetailAnimeHeaderCell.self, forHeaderFooterViewReuseIdentifier: headerID)
        //tableView.register(DetailAnimeHeaderCell.self, forCellReuseIdentifier: headerID)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? DetailAnimeCell else {
            return UITableViewCell()
        }
        
        cell.anime = anime
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as? DetailAnimeHeaderCell else {
            return UITableViewCell()
        }
        cell.anime = anime
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
}
