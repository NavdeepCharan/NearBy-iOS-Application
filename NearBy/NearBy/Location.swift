import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Location {
	public var lat : Double?
	public var lng : Double?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let location_list = Location.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Location Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Location]
    {
        var models:[Location] = []
        for item in array
        {
            models.append(Location(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let location = Location(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Location Instance.
*/
	required public init?(dictionary: NSDictionary) {

		lat = dictionary["lat"] as? Double
		lng = dictionary["lng"] as? Double
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.lat, forKey: "lat")
		dictionary.setValue(self.lng, forKey: "lng")

		return dictionary
	}

}
