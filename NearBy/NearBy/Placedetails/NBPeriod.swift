import Foundation


class NBPeriod: NSObject
{

	var close: NBClose?
	var open: NBClose?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let closeData = dictionary["close"] as? [String:Any]{
			close = NBClose(fromDictionary: closeData)
		}
		if let openData = dictionary["open"] as? [String:Any]{
			open = NBClose(fromDictionary: openData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if close != nil{
            dictionary["close"] = close?.toDictionary()
		}
		if open != nil{
            dictionary["open"] = open?.toDictionary()
		}
		return dictionary
	}
}
