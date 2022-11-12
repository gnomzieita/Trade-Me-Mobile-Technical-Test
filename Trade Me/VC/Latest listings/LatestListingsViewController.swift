//
//  LatestListingsViewController.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import UIKit

class LatestListingsViewController: RootViewController, UITableViewDelegate, UITableViewDataSource, LoadDataProtocol {
    
    @IBOutlet weak var table: UITableView!
    var listData: [ListModel] = []
    
    weak var coordinator: LatestListingsCoordenator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Latest listings"
        table.register(.init(nibName: "ListingsTableViewCell", bundle: .main), forCellReuseIdentifier: "ListingsTableViewCell")
        // Do any additional setup after loading the view.
        addNavigationButtonButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.delegat = self
    }
    
    func update(_ data: [ListModel]) {
        listData = data
        table.reloadData()
    }
    
    func addNavigationButtonButton() {
        let SearchButton = UIBarButtonItem(image:UIImage(named: "search"), style: .plain, target: self.coordinator, action: #selector(coordinator?.searchTap))
        let CartButton = UIBarButtonItem(image:UIImage(named: "cart"), style: .plain, target: self.coordinator, action: #selector(coordinator?.searchTap))
        navigationItem.rightBarButtonItems = [SearchButton, CartButton]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingsTableViewCell") as! ListingsTableViewCell
        let cellInfo = listData[indexPath.row]
        cell.setupInfo(data: cellInfo)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    // MARK: - Navigation

}
