//
//  SelectionCell.swift
//  CheckBoxExample
//
//  Created by Victor Baleeiro on 15/11/17.
//  Copyright © 2017 Going2. All rights reserved.
//

import Foundation
import UIKit

class SelectionCell: UITableViewCell {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: PROPRIEDADES
    //-------------------------------------------------------------------------------------------------------------
    @IBOutlet var btnSelection: UIButton!
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Ciclo de Vida
    //-------------------------------------------------------------------------------------------------------------
    override func awakeFromNib() {
        super .awakeFromNib()
        setupLayout()
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Setup
    //-------------------------------------------------------------------------------------------------------------
    func setupLayout() {
        
        selectionStyle = .none
        backgroundColor = UIColor.clear
        applyCheckBoxStyle(btnCheckBox: self.btnSelection)
        btnSelection.isUserInteractionEnabled = false
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Aux
    //-------------------------------------------------------------------------------------------------------------
    func configCell(option: Option) {
        btnSelection.setTitle(option.name, for: .normal)
        btnSelection.isSelected = option.selected
    }
    
    func applyCheckBoxStyle(btnCheckBox: UIButton) {
        
        //Please, config as needed
        btnCheckBox.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btnCheckBox.setTitleColor(UIColor.black, for: .normal)
        btnCheckBox.contentHorizontalAlignment = .left
        btnCheckBox.contentEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 5)
        btnCheckBox.imageEdgeInsets = UIEdgeInsetsMake(5, 16, 5, 5)
        btnCheckBox.titleEdgeInsets = UIEdgeInsetsMake(5, 24, 5, 5)
        btnCheckBox.titleLabel?.numberOfLines = 0
        btnCheckBox.imageView?.contentMode = .scaleAspectFit
        btnCheckBox.setImage(UIImage(named:"btn_checkbox_empty"), for: .normal)
        btnCheckBox.setImage(UIImage(named:"btn_checkbox_checked"), for: .selected)
    }
}
