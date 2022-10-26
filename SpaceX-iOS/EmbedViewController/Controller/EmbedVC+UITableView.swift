import UIKit

extension EmbedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .settingButton: return 1
        case .image: return 1
        case .parameterCell: return 1
        case .header: return 1
        case .titleWithDescription: return 1
        case .space: return 1
        case .startingButton: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = dataSource[indexPath.section]
        
        switch section {
        case .settingButton(let title):
            let cell = tableView.dequeueReusableCell(withIdentifier: EmbedSettingButtonCell.identifier, for: indexPath) as! EmbedSettingButtonCell
            cell.delegate = self
            cell.setup(title: title)
            return cell
            
        case .image(let i):
            let cell = tableView.dequeueReusableCell(withIdentifier: EmbedImageTableViewCell.identifier, for: indexPath) as! EmbedImageTableViewCell
            cell.setup(with: i)
            return cell
            
        case .parameterCell(let items):
            let cell = tableView.dequeueReusableCell(withIdentifier: EmbedParameterTableViewCell.identifier, for: indexPath) as! EmbedParameterTableViewCell
            cell.setup(items: items)
            return cell
            
        case .header(let title):
            let cell = tableView.dequeueReusableCell(withIdentifier: EmbedHeaderCell.identifier, for: indexPath) as! EmbedHeaderCell
            cell.setup(title: title)
            return cell
            
        case .titleWithDescription(let title, let description):
            let cell = tableView.dequeueReusableCell(withIdentifier: EmbedTitleWithDescriptionCell.identifier, for: indexPath) as! EmbedTitleWithDescriptionCell
            cell.setup(title: title, description: description)
            return cell
            
        case .startingButton(let title):
            let cell = tableView.dequeueReusableCell(withIdentifier: EmbedStartingButtonCell.identifier, for: indexPath) as! EmbedStartingButtonCell
            cell.delegate = self
            cell.setup(title: title)
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            return cell
            
        case .space:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = dataSource[indexPath.section]
        
        switch section {
        case .settingButton: return UITableView.automaticDimension
        case .image: return 300
        case .parameterCell: return 96
        case .header: return UITableView.automaticDimension
        case .titleWithDescription: return UITableView.automaticDimension
        case .startingButton: return UITableView.automaticDimension
        case .space(let space): return space
        }
    }
}

