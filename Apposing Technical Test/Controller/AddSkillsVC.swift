//
//  AddSkillsVC.swift
//  Apposing Technical Test
//
//  Created by sardar saqib on 22/05/2022.
//

import UIKit

class AddSkillsVC: UIViewController {
    
    @IBOutlet weak var searchSkillsSB: UISearchBar!
    @IBOutlet weak var addSkillsBtn: PrimaryGradientButton!
    @IBOutlet weak var skillsTblView: UITableView!
    private let networkRequests = NetworkRequests()
    private var skillsArray = [Skills]()
    private var filteredSkills = [Skills]()
    private var selectedSkills = [Skills]()
    weak var delegate: AddSkillsVCDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveSkills()
        configureSearchBar()
        skillsTblView.contentInset = UIEdgeInsets(top: view.layoutMargins.top, left: 0, bottom:  view.layoutMargins.bottom + 60, right:0)
      
    }
    
    
    @IBAction func addSkills() {
        
        var selectedSkills = [Skills]()
        guard let indexPaths = skillsTblView.indexPathsForSelectedRows else { return }
        for index in indexPaths {
            selectedSkills.append(skillsArray[index.row])
        }
        delegate?.didReceiveSelectedSkills(skills: selectedSkills)
        self.dismiss(animated: true)
    }
    
    
    // calling api
    private func retrieveSkills() {
        
        networkRequests.retrieveSkills { [weak self] (skills, error) in
            guard let strongSelf = self else { return }
            if let skills = skills {
                strongSelf.skillsArray = skills
                strongSelf.filteredSkills = skills
                strongSelf.skillsTblView.reloadData()
            }
            else {
                strongSelf.showAlert(message: "", title: error?.localizedDescription ?? "")
            }
        }
    }
    
}


// Search bar delegate & custom method implementation
extension AddSkillsVC: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != ""{
            
            self.filteredSkills
            = self.skillsArray.filter(
                {
                    $0.name.uppercased().contains(searchText.uppercased())
                })
        }
        else{
            self.filteredSkills = self.skillsArray
        }
        
        
        self.skillsTblView.reloadData()
        
        
    }
    func configureSearchBar(){
        
        searchSkillsSB.searchTextField.tintColor = #colorLiteral(red: 0.1960585713, green: 0.1989709735, blue: 0.2598623037, alpha: 1)
        searchSkillsSB.searchTextField.textColor = #colorLiteral(red: 0.1960585713, green: 0.1989709735, blue: 0.2598623037, alpha: 1)
        //searchSkillsSB.searchTextField.backgroundColor = .clear
        
    }
    
}
/// table view delegate
extension AddSkillsVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredSkills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddSkillsCell") as! AddSkillsCell
        cell.skillnameLbl.text = filteredSkills[indexPath.row].name
        selectedSkills.contains { skill in
            if skill.name == filteredSkills[indexPath.row].name {
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
                return true
            } else {
                return false
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSkills.append(filteredSkills[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedSkills.removeAll { item in
            if item.id == filteredSkills[indexPath.row].id {
                return true
            } else {
                return false
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
