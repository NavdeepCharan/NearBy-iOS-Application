import Foundation


class NBLocation: NSObject
{

	var lat: NSNumber?
	var lng: NSNumber?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		lat = dictionary["lat"] as? NSNumber
		lng = dictionary["lng"] as? NSNumber
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if lat != nil{
			dictionary["lat"] = lat
		}
		if lng != nil{
			dictionary["lng"] = lng
		}
		return dictionary
	}

}
