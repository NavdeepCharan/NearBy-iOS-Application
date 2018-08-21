import Foundation


class NBGeometry: NSObject
{

	var location: NBLocation?
	var viewport: NBViewport?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let locationData = dictionary["location"] as? [String:Any]{
			location = NBLocation(fromDictionary: locationData)
		}
		if let viewportData = dictionary["viewport"] as? [String:Any]{
			viewport = NBViewport(fromDictionary: viewportData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if location != nil{
            dictionary["location"] = location?.toDictionary()
		}
		if viewport != nil{
            dictionary["viewport"] = viewport?.toDictionary()
		}
		return dictionary
	}
}
