//
//  ContentCheckBoxViewController.swift
//  CheckBoxExample
//
//  Created by Victor Baleeiro on 15/11/17.
//  Copyright © 2017 Going2. All rights reserved.
//

import Foundation
import UIKit

class ContentCheckBoxViewController: UIViewController {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    //Views
    @IBOutlet weak var tbvOpcoes: UITableView!
    @IBOutlet weak var viewHeader: UIView!

    //Control, aux
    var listaOpcoes: Array = [ Option.init(name: "Playstation 4", selected: false) , Option.init(name: "Xbox One", selected: false), Option.init(name: "Super Nintendo", selected: false), Option.init(name: "Atari", selected: false), Option.init(name: "Outros", selected: false) ].sorted(by: { $0.name < $1.name })
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Lifecycle
    //-------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupData()
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Setup
    //-------------------------------------------------------------------------------------------------------------
    func setupData() {
        //Tableview
        tbvOpcoes.allowsMultipleSelection = true
        tbvOpcoes.separatorStyle = .none
        tbvOpcoes.separatorColor = UIColor.clear
        tbvOpcoes.tableHeaderView = viewHeader
        tbvOpcoes.tableFooterView = UIView()
        tbvOpcoes.delegate = self
        tbvOpcoes.dataSource = self
    }
}


//-------------------------------------------------------------------------------------------------------------
// MARK: UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------
extension ContentCheckBoxViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Obtem opção através do indice
        let option: Option = listaOpcoes[indexPath.row]
        if (option.selected) {
            
            //remove seleção do item
            self.tableView(tbvOpcoes, didDeselectRowAt: indexPath)
            
        } else {
            
            //Substitui objeto na lista
            option.selected = true
            listaOpcoes[indexPath.row] = option
            
            //Item selecionado
            tbvOpcoes.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        //Obtem opção através do indice
        let option: Option = listaOpcoes[indexPath.row]
        if (!option.selected) {
            
            //seleciona item
            self.tableView(tbvOpcoes, didSelectRowAt: indexPath)
            
        } else {
            
            //Substitui objeto na lista
            option.selected = false
            listaOpcoes[indexPath.row] = option
            
            //Item deselecionado
            tbvOpcoes.reloadData()
        }
    }
}


//-------------------------------------------------------------------------------------------------------------
// MARK: UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------
extension ContentCheckBoxViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaOpcoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: SelectionCell = tableView.dequeueReusableCell(withIdentifier: "SelectionCell")! as! SelectionCell
        
        //Obtem opção conforme indice
        cell.configCell(option: listaOpcoes[indexPath.row])
        return cell
    }
}
