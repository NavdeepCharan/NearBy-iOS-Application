import Foundation


class NBPlaceDetails: NSObject
{

	var htmlAttributions: [AnyObject]?
	var result: NBResult?
	var status: String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		htmlAttributions = dictionary["html_attributions"] as? [AnyObject]
		if let resultData = dictionary["result"] as? [String:Any]{
			result = NBResult(fromDictionary: resultData)
		}
		status = dictionary["status"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if htmlAttributions != nil{
			dictionary["html_attributions"] = htmlAttributions
		}
		if result != nil{
            dictionary["result"] = result?.toDictionary()
		}
		if status != nil{
			dictionary["status"] = status
		}
		return dictionary
	}
}
