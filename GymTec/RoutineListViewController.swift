//
//  RoutineListViewController.swift
//  GymTec
//
//  Created by cdt307 on 3/20/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit

class RoutineListViewController: UITableViewController, UISearchResultsUpdating {
    let routinesStringURL =  "http://martinmolina.com.mx/201911/data/iGym/Routines.json"
    var routinesObj:[Any]?
    
    func JSONParseArray(_ string: String) -> [AnyObject]{
        if let data = string.data(using: String.Encoding.utf8){
            
            do{
                
                if let array = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)  as? [AnyObject] {
                    return array
                }
            }catch{
                print("error")
                //handle errors here
            }
        }
        return [AnyObject]()
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    var routinesFiltrados = [Any]()
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! == "" {
            routinesFiltrados = routinesObj!
        }else{
            routinesFiltrados = routinesObj!.filter{
                let objetoRoutines = $0 as! [String:Any]
                let s:String = objetoRoutines["Nombre"] as! String
                return(s.lowercased().contains((searchController.searchBar.text!.lowercased())))
            }
        }
        //  Se recarga la vista con los nuevos datos
        self.tableView.reloadData()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let routinesURL = URL(string: routinesStringURL)
        let data = try? Data(contentsOf: routinesURL!)
        routinesObj = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [AnyObject]
        
        routinesFiltrados = routinesObj!
        
        // Se usa la vista actual para presentar los datos resultantes de la búsqueda
        // Linea de asignación del delegado
        searchController.searchResultsUpdater = self
        
        // Mejora la experiencia de usuario para hacer un enfoque cuando se esté en modo de busqueda
        searchController.dimsBackgroundDuringPresentation = true
        
        // Se define el contexto de la búsqueda
        self.definesPresentationContext = false
        
        // Instalar la barra de búsqueda en cabecera de la tabla
        tableView.tableHeaderView = searchController.searchBar
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return routinesFiltrados.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda2", for: indexPath)
        
        // Configure the cell...
        let objetoRoutines = routinesFiltrados[indexPath.row] as! [String:Any]
        let nombre:String = objetoRoutines["Nombre"] as! String
        cell.textLabel?.text = nombre
        
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        var siguiente = segue.destination as! DetalleRoutinesViewController
        var indice = self.tableView.indexPathForSelectedRow?.row
        
        let objetoRoutines = routinesFiltrados[indice!] as! [String:Any]
        let nombre:String = objetoRoutines["Nombre"] as! String
        let descripc:String = objetoRoutines["Descripcion"] as! String
        siguiente.nom = nombre
        siguiente.descrip = descripc
    }
    
    
    @IBAction func ReturnMain(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
