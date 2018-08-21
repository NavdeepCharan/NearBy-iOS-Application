import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Viewport {
	public var northeast : Northeast?
	public var southwest : Southwest?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let viewport_list = Viewport.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Viewport Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Viewport]
    {
        var models:[Viewport] = []
        for item in array
        {
            models.append(Viewport(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let viewport = Viewport(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Viewport Instance.
*/
	required public init?(dictionary: NSDictionary) {

		if (dictionary["northeast"] != nil) { northeast = Northeast(dictionary: dictionary["northeast"] as! NSDictionary) }
		if (dictionary["southwest"] != nil) { southwest = Southwest(dictionary: dictionary["southwest"] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.northeast?.dictionaryRepresentation(), forKey: "northeast")
		dictionary.setValue(self.southwest?.dictionaryRepresentation(), forKey: "southwest")

		return dictionary
	}

}
