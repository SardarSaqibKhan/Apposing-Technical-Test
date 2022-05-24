//
//  SuggestedSkillsVC.swift
//  Apposing Technical Test
//
//  Created by sardar saqib on 22/05/2022.
//

import UIKit

final class SuggestedSkillsVC: UIViewController {
    
    @IBOutlet weak var addskill:UIButton!
    private let networkRequests = NetworkRequests()
    private var suggestedSkills = [Skills]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient.frame = addskill.bounds
        addskill.layer.addSublayer(gradient)
        
    }

    @IBAction func addMore_skills() {
        
        presentFilterView()
    }
    
    // calling api
    private func retrieveSkills(){
        
        networkRequests.retrieveSkills { (skills, error) in
            if let skills = skills{
                self.suggestedSkills = skills
                
            }
            else{
                print(error?.localizedDescription)
            }
        }
    }
}

extension SuggestedSkillsVC {
    
    func presentFilterView(){
        
        let filterView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addskills")
        filterView.modalPresentationStyle = .formSheet
        present(filterView, animated: true, completion: nil)
    }
    
}
