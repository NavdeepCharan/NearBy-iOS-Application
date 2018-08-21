import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import FacebookLogin
import FacebookCore
import GoogleSignIn

class UISecondViewController: UIViewController, GIDSignInUIDelegate
{
    //@IBOutlet weak var signInButton: GIDSignInButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    
   //==================================================================
    // google sign in
    
 
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!)
    {
        
        UIActivityIndicatorView()
    }
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                       withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            print(user.userID)                  // For client-side use only!
            print(user.authentication.idToken) // Safe to send to the server
            print(user.profile.name)
            print(user.profile.givenName)
            print(user.profile.familyName)
            print(user.profile.email)
            // ...
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    
 
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    
    
    /*@IBOutlet weak var googleButton: GIDSignInButton!
    @IBAction func googleButton(sender: AnyObject) {
        GIDSignIn.sharedInstance().delegate = self as! GIDSignInDelegate
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }*/
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            // ...
        } else {
            //println("\(error.localizedDescription)")
        }
    }
    
    
    
    @IBAction func fbloginbtn()
    {
        let loginManager = LoginManager()
        loginManager.logIn(publishPermissions: [.publishActions], viewController: self)
        { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.getFBUserData()
                break
            }
        }
       
    }
    
    @IBAction func googleLogin()
    {
            GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            print(user.userID)                  // For client-side use only!
            print(user.authentication.idToken) // Safe to send to the server
            print(user.profile.name)
            print(user.profile.givenName)
            print(user.profile.familyName)
            print(user.profile.email)
            UserDefaults.standard.set(user.profile.name, forKey: "name")
            self.performSegue(withIdentifier: "presentCityPage", sender: nil)
            // ...
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
        print(error)
    }
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    let dict = result as! [String : AnyObject]
                    print(result!)
                    UserDefaults.standard.set(dict["name"], forKey: "name")
                    self.performSegue(withIdentifier: "presentCityPage", sender: nil)
                   // print(self.dict)
                }
            })
        }
    }
    
}



