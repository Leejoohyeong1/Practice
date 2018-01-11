//
//  ViewControllor2.swift
//  TableView_simple
//
//  Created by LEE on 2018. 1. 10..
//  Copyright © 2018년 LEE. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var WOW: UILabel!

    
    var submit:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WOW.text=submit
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func BackButton(_ sender: Any) {
        
        
        //화면 이동
        let storyboard: UIStoryboard = self.storyboard!
        //이동할 컨트롤을 들고 온다
        let nextView = storyboard.instantiateViewController(withIdentifier: "HomeView") as! ViewController
      
        present(nextView, animated: true, completion: nil)
    }
    
    
}


