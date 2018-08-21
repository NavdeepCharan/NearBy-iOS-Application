import Foundation



class NBClose: NSObject
{

	var day: NSNumber?
	var time: String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		day = dictionary["day"] as? NSNumber
		time = dictionary["time"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if day != nil{
			dictionary["day"] = day
		}
		if time != nil{
			dictionary["time"] = time
		}
		return dictionary
	}
}
