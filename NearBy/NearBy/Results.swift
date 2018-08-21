import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Results {
	public var geometry : Geometry?
	public var icon : String?
	public var id : String?
	public var name : String?
	public var photos : Array<Photos>?
	public var place_id : String?
	public var rating : Double?
	public var reference : String?
	public var scope : String?
	public var types : Array<String>?
	public var vicinity : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let results_list = Results.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Results Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Results]
    {
        var models:[Results] = []
        for item in array
        {
            models.append(Results(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let results = Results(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Results Instance.
*/
	required public init?(dictionary: NSDictionary) {

		if (dictionary["geometry"] != nil) { geometry = Geometry(dictionary: dictionary["geometry"] as! NSDictionary) }
		icon = dictionary["icon"] as? String
		id = dictionary["id"] as? String
		name = dictionary["name"] as? String
        if (dictionary["photos"] != nil) { photos = Photos.modelsFromDictionaryArray(array: dictionary["photos"] as! NSArray) }
		place_id = dictionary["place_id"] as? String
		rating = dictionary["rating"] as? Double
		reference = dictionary["reference"] as? String
		scope = dictionary["scope"] as? String
		vicinity = dictionary["vicinity"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.geometry?.dictionaryRepresentation(), forKey: "geometry")
		dictionary.setValue(self.icon, forKey: "icon")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.place_id, forKey: "place_id")
		dictionary.setValue(self.rating, forKey: "rating")
		dictionary.setValue(self.reference, forKey: "reference")
		dictionary.setValue(self.scope, forKey: "scope")
		dictionary.setValue(self.vicinity, forKey: "vicinity")

		return dictionary
	}

}
