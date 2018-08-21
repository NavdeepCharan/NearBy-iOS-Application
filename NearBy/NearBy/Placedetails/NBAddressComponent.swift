
import Foundation


class NBAddressComponent: NSObject
{

	var longName: String?
	var shortName: String?
	var types: [String]?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		longName = dictionary["long_name"] as? String
		shortName = dictionary["short_name"] as? String
		types = dictionary["types"] as? [String]
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if longName != nil{
			dictionary["long_name"] = longName
		}
		if shortName != nil{
			dictionary["short_name"] = shortName
		}
		if types != nil{
			dictionary["types"] = types
		}
		return dictionary
	}

}
