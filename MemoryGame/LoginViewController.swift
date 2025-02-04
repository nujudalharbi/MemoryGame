//
//  LoginViewController.swift
//  MemoryGame
//
//  Created by Afnan Theb on 19/04/1443 AH.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var player : Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func getUser(username: String?, password: String?){
        if let username = username, let password = password {
            let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Player")
            fetchRequest.predicate = NSPredicate(format: "username = %@", username)
            //fetchRequest.predicate = NSPredicate(format: "password = %@", password)
            
            do {
                let fetchPlayer = try context.fetch(fetchRequest)
                if fetchPlayer.indices.contains(0) {
                    let myPlayer = fetchPlayer[0] as! Player
                        print(myPlayer.username ?? "Not Found")
                        print(myPlayer.password ?? "Not Found")
                        print(myPlayer.email ?? "Not Found")
                } else {
                    print("User not found")
                }
            } catch {
                print("Error fetch user")
            }

        } else {
            print("Complete username/password field")
        }
    }
    @IBAction func loginAction(_ sender: Any) {
        getUser(username: username.text, password: password.text)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
