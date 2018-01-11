//
//  ViewController.swift
//  TableView_simple
//
//  Created by LEE on 2018. 1. 10..
//  Copyright © 2018년 LEE. All rights reserved.
//

import UIKit



class myCell:UITableViewCell {
    @IBOutlet weak var tittle: UILabel!
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var itemcount: UILabel!
    @IBOutlet weak var addText: UITextField!
    
    @IBOutlet weak var Table: UITableView!
    
    var list:[String] = ["피카츄","라이츄","파이리","꺼북이","버터폴","야도란","피존투","또가스"]
    var submit:String? = "week"
  
    
    
    // 추가 삽입
    @IBAction func addAction(_ sender: Any) {
        let temp = addText.text
        list.append(temp!)
        itemcount.text = String(list.count)
        
        let indexpath = IndexPath(row: self.list.count-1, section: 0)
        self.Table.insertRows(at: [indexpath], with: UITableViewRowAnimation.automatic)
        addText.text = ""
        
    }
    

    
    // 셀에 갯수 리턴
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // 각셀을 데이터지정 ?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Call = tableView.dequeueReusableCell(withIdentifier: "itme", for: indexPath) as! myCell
        
        Call.tittle.text = list[indexPath.row]
        
        return Call
        
    }
    
    // 셀 터치시 이벤트(터치시 해당인덱스 IndexPath 값을 가지고 있다)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        
        submit = list[indexPath.row]
        print(submit!)
        
        //화면 이동
        let storyboard: UIStoryboard = self.storyboard!
        //이동할 컨트롤을 들고 온다
        let nextView = storyboard.instantiateViewController(withIdentifier: "nextView") as! ViewController2
        nextView.submit = self.submit
        //이동하낟
        present(nextView, animated: true, completion: nil)
    }
    
    
    // segue로 이동하는데 씹별루 인것 같다 그냥 넘기도록하자
    override func prepare(for segue:UIStoryboardSegue, sender:Any?) {
//        if segue.identifier == "nextView",
//            let dest = segue.destination as? ViewController2
//        {
//            submit = list[indexPath.row]
//            dest.submit = submit
//        }
    }
    
    //call를 지우는 함수다
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //배열에서 지운다
            list.remove(at: indexPath.row)
            //뷰에서도 지운다
            tableView.deleteRows(at: [indexPath], with: .fade)
            itemcount.text = String(list.count)
        }
    }

    //안드에 온스타 인지 온크레이트엑티비인지 모르겠다
    override func viewDidLoad() {
        super.viewDidLoad()
        itemcount.text = String(list.count)
        // Do any additional setup after loading the view, typically from a nib.
    }

    //안드에 퍼즈인가 인듯 나중에 찾아보자
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

