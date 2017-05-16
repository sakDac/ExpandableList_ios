//
//  ViewController.swift
//  ExpandedListAnimation
//
//  Created by admin1 on 15/05/17.
//  Copyright © 2017 admin1. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var list : [Model]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formDataModel()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    func formDataModel(){
      list = [Model]()
        let m1 = Model(parent: "Oprah Winfrey", childDesp: "Main sources are television, radio, and film. Additional business holdings in Harpo Productions and the Oprah Winfrey Network with interests in film, television, magazines, books, motivational speaking, and publishing.")
       
        let m2 = Model(parent: "Madonna", childDesp: "Main sources of wealth include royalties and proceeds from music, fashion, music touring, film-making, and record production. She founded her own record label, Maverick Records established in the 1990s. Guinness World Records name her as the Best-selling female recording artist of all time selling over 300 million albums in her career. Total record sales of 500,000,000 (over 300,000,000 albums and 200,000,000 singles) also add to her net worth along with her Sticky and Sweet Tour which is the highest grossing solo tour of all time achieving a gross of $408,000,000. ")
        
        let m3 = Model(parent: "50 Cent", childDesp: "Main sources include music, film, and television. Various external ventures include sports endorsements with Reebok and his clothing company, the G-Unit Clothing Company video games, record labels: G-Unit Records and G-Note Records. Additional holdings in consumer electronics such as SMS Audio headphones, dietary supplements, condoms and Pure 50 RGX Body Spray as a joint venture with Right Guard, investments.")
      
        let m4 = Model(parent: "Jay-Z", childDesp: "Main sources mainly stakes in Roc Nation, Carol's Daughter, the Brooklyn Nets, and more significantly, the Barclays Center itself—while adding new partnerships with the likes of Duracell, Budweiser and Bacardi’s D’ussé Cognac.bars and nightclubs, books, clothing line Rocawear, real estate development which includes the Barclay's Center, to which sold his 1.5 million stake in September 2013,[36] music touring, music publishing, casinos, advertising, other investments within his conglomerate (Gain Global Investments LLC).")
    
        let m5 = Model(parent: "Sean Combs", childDesp: "Main sources mainly in television, film, and music. Other holdings include the record label Bad Boy Records, fashion designing and the Sean John Clothing Line, namely his deal with Diageo’s Ciroc, restaurants, vodka, television production, business education, and fragrances. Combs also has a major equity stake in Revolt TV, a newly launched television network.")
  
        let m6 = Model(parent: "Martha Stewart", childDesp: "Main sources mainly in radio, television, film, and her conglomerate Martha Stewart Living Omnimedia, which includes interests in television production, magazines, cookbooks, and household cooking products. Other products include cookbooks, books and instructional manuals for the home decorator. Remaining sources include internet related ventures, satellite radio show, blogging, publishing, books, and retail merchandising.")
   
        let m7 = Model(parent: "Magic Johnson", childDesp: "Main sources primarily in television and sports. Other holdings include the promotion and theater chain Magic Johnson Theatres, movie studios, food services, coffee shops, sports teams (minority stake in the LA Lakers), and motivational speaking. As chairman and CEO of Magic Johnson Enterprises, Johnson owns movie theaters, restaurants, and gyms. Johnson also owns a stake in the Los Angeles Dodgers along with several.")

        let m8 = Model(parent: "Arnold Schwarzenegger", childDesp: "Main sources include films and bodybuilding. Minor holdings in various global businesses, restaurants, real estate, Planet Hollywood, and other investments.")
        
        list?.append(m1)
        list?.append(m2)
        list?.append(m3)
        list?.append(m4)
        list?.append(m5)
        list?.append(m6)
        list?.append(m7)
        list?.append(m8)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (list?.count)!;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PCTableViewCell
        let model = list?[indexPath.row]
        cell.parentTitle.text = model?.parentTitle
        cell.childDesc.text = (model?.isExpanded)! ? model?.childDescription : ""
        if (model?.isExpanded)! {
            cell.imageChild.image = indexPath.row % 2 == 0 ? UIImage(named: "1") : UIImage(named: "2")
        }else{
            cell.imageChild.image = UIImage(named: "")
        }
        cell.selectionStyle = .none
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = list?[indexPath.row]
        model?.isExpanded = !(model?.isExpanded)!
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
    
    // Mark : enable segue from cell to see animation 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
      if let vc = segue.destination as? AnimateViewController,
        
       let _ = tableView.indexPathForSelectedRow {
            vc.aniamtionIndex = 34
        }
        
    }
    
}

