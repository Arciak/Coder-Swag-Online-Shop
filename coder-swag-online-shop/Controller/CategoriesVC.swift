//
//  ViewController.swift
//  coder-swag-online-shop
//
//  Created by Artur Zarzecki on 19/01/2021.
//  Copyright © 2021 Artur Zarzecki. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoryTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.dataSource = self //category is self class thats why we have UITable next to UIView
        categoryTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count // tutaj liczymy ile wierszy będzie w TableView (ile mamy danych)
        // i dzięki sigletonowi nie trzeba tego ciagle implementowac czyli let instance = DataServoce(), oszczędzamy miejsce w pamięci
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    
    // poprzez segue przesyłamy dane ponizej je przygotwujemy
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    // a tu przesylamy
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductsVC {
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            
            assert(sender as? Category != nil) //only for build time, this is protection
            productsVC.initProducts(category: sender as! Category)
        }
    }
    

}

