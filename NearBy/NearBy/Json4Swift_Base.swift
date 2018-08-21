import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Json4Swift_Base {
	public var html_attributions : Array<String>?
	public var next_page_token : String?
	public var results : Array<Results>?
	public var status : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Json4Swift_Base]
    {
        var models:[Json4Swift_Base] = []
        for item in array
        {
            models.append(Json4Swift_Base(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		next_page_token = dictionary["next_page_token"] as? String
        if (dictionary["results"] != nil) { results = Results.modelsFromDictionaryArray(array: dictionary["results"] as! NSArray) }
		status = dictionary["status"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.next_page_token, forKey: "next_page_token")
		dictionary.setValue(self.status, forKey: "status")

		return dictionary
	}

}
