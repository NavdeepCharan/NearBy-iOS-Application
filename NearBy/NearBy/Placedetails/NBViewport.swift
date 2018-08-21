import Foundation


class NBViewport: NSObject
{

	var northeast: NBLocation?
	var southwest: NBLocation?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let northeastData = dictionary["northeast"] as? [String:Any]{
			northeast = NBLocation(fromDictionary: northeastData)
		}
		if let southwestData = dictionary["southwest"] as? [String:Any]{
			southwest = NBLocation(fromDictionary: southwestData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if northeast != nil{
            dictionary["northeast"] = northeast?.toDictionary()
		}
		if southwest != nil{
            dictionary["southwest"] = southwest?.toDictionary()
		}
		return dictionary
	}
}
