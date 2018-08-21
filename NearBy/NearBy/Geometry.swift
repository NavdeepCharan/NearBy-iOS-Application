import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Geometry {
	public var location : Location?
	public var viewport : Viewport?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let geometry_list = Geometry.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Geometry Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Geometry]
    {
        var models:[Geometry] = []
        for item in array
        {
            models.append(Geometry(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let geometry = Geometry(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Geometry Instance.
*/
	required public init?(dictionary: NSDictionary) {

		if (dictionary["location"] != nil) { location = Location(dictionary: dictionary["location"] as! NSDictionary) }
		if (dictionary["viewport"] != nil) { viewport = Viewport(dictionary: dictionary["viewport"] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.location?.dictionaryRepresentation(), forKey: "location")
		dictionary.setValue(self.viewport?.dictionaryRepresentation(), forKey: "viewport")

		return dictionary
	}

}
