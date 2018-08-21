import Foundation


class NBPhoto: NSObject
{

	var height: NSNumber?
	var htmlAttributions: [String]?
	var photoReference: String?
	var width: NSNumber?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		height = dictionary["height"] as? NSNumber
		htmlAttributions = dictionary["html_attributions"] as? [String]
		photoReference = dictionary["photo_reference"] as? String
		width = dictionary["width"] as? NSNumber
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if height != nil{
			dictionary["height"] = height
		}
		if htmlAttributions != nil{
			dictionary["html_attributions"] = htmlAttributions
		}
		if photoReference != nil{
			dictionary["photo_reference"] = photoReference
		}
		if width != nil{
			dictionary["width"] = width
		}
		return dictionary
	}

}
