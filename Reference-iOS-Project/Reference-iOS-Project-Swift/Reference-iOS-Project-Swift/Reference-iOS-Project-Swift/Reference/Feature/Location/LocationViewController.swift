//
//  MIT License
//
//  Copyright (c) 2023 Fay-Ho
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

class LocationViewController : UITableViewController {
    var interactor: LocationInteractorInterface?
    var dataModel: LocationDataModel?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStyling()
        interactor?.viewIsReady()
    }
}

// MARK: - Subview Management

extension LocationViewController {
    func updateStyling() {
        view.backgroundColor = .wallpaper
    }
}

// MARK: - UITableViewDataSource Implementation

extension LocationViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataModel?.rowDataModels.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "identifier")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "identifier")
            cell?.textLabel?.textColor = .font
            cell?.backgroundColor = .clear
        }
        cell?.textLabel?.text = dataModel?.rowDataModels[indexPath.row].name
        return cell!
    }
}

// MARK: - LocationViewControllerInterface Implementation

extension LocationViewController : LocationViewControllerInterface {
    func updateTableView(dataModel: LocationDataModel) {
        self.dataModel = dataModel
    }
}
