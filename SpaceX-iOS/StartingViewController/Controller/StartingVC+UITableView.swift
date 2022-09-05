import UIKit

extension StartingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StartingTableViewCell.identifier, for: indexPath) as! StartingTableViewCell
        let launch = launches[indexPath.row]
        cell.setup(name: launch.name,
                   date: launch.dateLocal.convertDateFormat(from: "yyyy-MM-dd'T'HH:mm:ssZ", to: "dd MMMM, yyyy"),
                   success: launch.success)
        return cell
    }
}


//UINavigationController().navigationBar.isTranslucent = false // прозрачность
