//
//  AnimeVC.swift
//  DecodableTuto
//
//  Created by YouSS on 2/23/19.
//  Copyright © 2019 YouSS. All rights reserved.
//

import UIKit

class AnimeVC: UITableViewController {
    
    var animeViewModels = [AnimeViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        AnimeService.instance.getAnimes { (animes) in
            self.animeViewModels = animes.map{AnimeViewModel(anime: $0)}
            self.tableView.reloadData()
        }
    }
    
    func setupView() {
        self.title = "Winter 2019"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(AnimeCell.self, forCellReuseIdentifier: cellID)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? AnimeCell else {
            return UITableViewCell()
        }
        
        cell.animeViewModel = animeViewModels[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animeViewModel = animeViewModels[indexPath.row]
        let vc = DetailAnimeVC(style: .grouped)
        vc.animeViewModel = animeViewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
}

