import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Photos {
	public var height : Int?
	public var html_attributions : Array<String>?
	public var photo_reference : String?
	public var width : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let photos_list = Photos.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Photos Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Photos]
    {
        var models:[Photos] = []
        for item in array
        {
            models.append(Photos(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let photos = Photos(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Photos Instance.
*/
	required public init?(dictionary: NSDictionary) {

		height = dictionary["height"] as? Int
		photo_reference = dictionary["photo_reference"] as? String
		width = dictionary["width"] as? Int
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.height, forKey: "height")
		dictionary.setValue(self.photo_reference, forKey: "photo_reference")
		dictionary.setValue(self.width, forKey: "width")

		return dictionary
	}

}
