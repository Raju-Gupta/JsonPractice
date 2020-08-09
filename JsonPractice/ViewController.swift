//
//  ViewController.swift
//  JsonPractice
//
//  Created by Raju Gupta on 21/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let StringUrl = "https://jsonplaceholder.typicode.com/photos"
    var allPhotos = [Photos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllPhotos()
        getAllUsers()
        
    }
    
    func getAllPhotos()
    {
        let url = URL(string: StringUrl)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do
            {
                if let data = data
                {
                    self.allPhotos = try JSONDecoder().decode([Photos].self, from: data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            catch
            {
                print("error")
            }
        }.resume()
    }
    
    func getAllUsers()
    {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { (data, resopnse, err) in
            do
            {
                if let data = data
                {
                    let allUser = try JSONDecoder().decode([Users].self, from: data)
                    let result = allUser.map{$0.id * 2}
                    print(result)
                }
                
            }
            catch
            {
                print("error")
            }
        }.resume()
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let urlImg = allPhotos[indexPath.row].url
        let url = URL(string: urlImg)!
        if let data = try? Data(contentsOf: url)
        {
            cell.imgUrlImage.image = UIImage(data: data)
        }
        let urlthumb = allPhotos[indexPath.row].thumbnailUrl
        let url2 = URL(string: urlthumb)!
        if let data = try? Data(contentsOf: url2)
        {
            cell.imgthumb.image = UIImage(data: data)
        }
        cell.lblTitle.text = allPhotos[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 234
    }
}

