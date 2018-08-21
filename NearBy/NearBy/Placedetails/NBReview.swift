import Foundation


class NBReview: NSObject
{

	var authorName: String?
	var authorUrl: String?
	var language: String?
	var profilePhotoUrl: String?
	var rating: NSNumber?
	var relativeTimeDescription: String?
	var text: String?
	var time: NSNumber?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		authorName = dictionary["author_name"] as? String
		authorUrl = dictionary["author_url"] as? String
		language = dictionary["language"] as? String
		profilePhotoUrl = dictionary["profile_photo_url"] as? String
		rating = dictionary["rating"] as? NSNumber
		relativeTimeDescription = dictionary["relative_time_description"] as? String
		text = dictionary["text"] as? String
		time = dictionary["time"] as? NSNumber
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if authorName != nil{
			dictionary["author_name"] = authorName
		}
		if authorUrl != nil{
			dictionary["author_url"] = authorUrl
		}
		if language != nil{
			dictionary["language"] = language
		}
		if profilePhotoUrl != nil{
			dictionary["profile_photo_url"] = profilePhotoUrl
		}
		if rating != nil{
			dictionary["rating"] = rating
		}
		if relativeTimeDescription != nil{
			dictionary["relative_time_description"] = relativeTimeDescription
		}
		if text != nil{
			dictionary["text"] = text
		}
		if time != nil{
			dictionary["time"] = time
		}
		return dictionary
	}

}
