//
//  SuggestedSkillsVC.swift
//  Apposing Technical Test
//
//  Created by sardar saqib on 22/05/2022.
//

import UIKit
import TagListView



final class SuggestedSkillsVC: UIViewController {
    
    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var suggestedLbl: UILabel!
    
    
    private let networkRequests = NetworkRequests()
    private var suggestedSkills = [Skills]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTagListView()
        retrieveSkills()
        suggestedLbl.attributedText =  suggestedLbl.suggestedLblText
        
    }
    

    private func configureTagListView() {
        
        tagListView.textFont = UIFont.systemFont(ofSize: 14)
        tagListView.alignment = .center
        tagListView.delegate = self
        
    }
    
    @IBAction func addMore_skills() {
        
        presentFilterView()
    }
    @IBAction func confirmMy_skills() {
        
        checkAlert_conditions()
        
    }
    
    // calling api
    private func retrieveSkills() {
        
        networkRequests.retrieveSuggestedSkills { [weak self] (skills, error) in
            guard let strongSelf = self else { return }
            if let skills = skills {
                strongSelf.suggestedSkills = skills
                skills.forEach { strongSelf.tagListView.addTag($0.name)}
            }
            else {
                strongSelf.showAlert(message: "", title: error?.localizedDescription ?? "")
            }
        }
    }
}

extension SuggestedSkillsVC {
    
    func presentFilterView(){
        
        guard let filterView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addskills") as? AddSkillsVC else { return }
        filterView.modalPresentationStyle = .formSheet
        filterView.delegate = self
        present(filterView, animated: true, completion: nil)
    }
    
}

// Taglist view delegates
extension SuggestedSkillsVC: TagListViewDelegate {
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        tagListView.removeTag(title)
        suggestedSkills.removeAll { $0.name == title }
        print(tagListView.frame.size.height)
        
    }
}

// custom delegate
extension SuggestedSkillsVC: AddSkillsVCDelegate {
    func didReceiveSelectedSkills(skills: [Skills]) {
        suggestedSkills.append(contentsOf: skills)
        tagListView.removeAllTags()
        suggestedSkills.forEach { tagListView.addTag($0.name)}
        
    }
}

// poping alert message
extension SuggestedSkillsVC{
    
    func checkAlert_conditions(){
        if suggestedSkills.count < 5{
            
            print("Skills can't be less than 5")
            showAlert(message:"Alert",title:"Skills can't be less than 5")
        }
        else if suggestedSkills.count > 20 {
            
            print("Skills can't be more than 20")
            showAlert(message:"Alert",title:"Skills can't be more than 20")
        }
        else{
            
            print("Congrates your skills has been confirmed")
            showAlert(message:"Alert",title:"Congrates your skills has been confirmed")
            
        }
    }
}
