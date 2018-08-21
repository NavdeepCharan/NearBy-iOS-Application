import Foundation

class NBResult: NSObject
{

	var addressComponents: [NBAddressComponent]?
	var adrAddress: String?
	var formattedAddress: String?
	var formattedPhoneNumber: String?
	var geometry: NBGeometry?
	var icon: String?
	var id: String?
	var internationalPhoneNumber: String?
	var name: String?
	var openingHours: NBOpeningHour?
	var photos: [NBPhoto]?
	var placeId: String?
	var rating: NSNumber?
	var reference: String?
	var reviews: [NBReview]?
	var scope: String?
	var types: [String]?
	var url: String?
	var utcOffset: NSNumber?
	var vicinity: String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any])
    {
		addressComponents = [NBAddressComponent]()
		if let addressComponentsArray = dictionary["address_components"] as? [[String:Any]]{
			for dic in addressComponentsArray
            {
				let value = NBAddressComponent(fromDictionary: dic)
                addressComponents?.append(value)
			}
		}
		adrAddress = dictionary["adr_address"] as? String
		formattedAddress = dictionary["formatted_address"] as? String
		formattedPhoneNumber = dictionary["formatted_phone_number"] as? String
		if let geometryData = dictionary["geometry"] as? [String:Any]{
			geometry = NBGeometry(fromDictionary: geometryData)
		}
		icon = dictionary["icon"] as? String
		id = dictionary["id"] as? String
		internationalPhoneNumber = dictionary["international_phone_number"] as? String
		name = dictionary["name"] as? String
		if let openingHoursData = dictionary["opening_hours"] as? [String:Any]{
			openingHours = NBOpeningHour(fromDictionary: openingHoursData)
		}
		photos = [NBPhoto]()
		if let photosArray = dictionary["photos"] as? [[String:Any]]{
			for dic in photosArray{
				let value = NBPhoto(fromDictionary: dic)
				photos?.append(value)
			}
		}
		placeId = dictionary["place_id"] as? String
		rating = dictionary["rating"] as? NSNumber
		reference = dictionary["reference"] as? String
		reviews = [NBReview]()
		if let reviewsArray = dictionary["reviews"] as? [[String:Any]]{
			for dic in reviewsArray{
				let value = NBReview(fromDictionary: dic)
				reviews?.append(value)
			}
		}
		scope = dictionary["scope"] as? String
		types = dictionary["types"] as? [String]
		url = dictionary["url"] as? String
		utcOffset = dictionary["utc_offset"] as? NSNumber
		vicinity = dictionary["vicinity"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if addressComponents != nil{
			var dictionaryElements = [[String:Any]]()
            for addressComponentsElement in addressComponents!
            {
				dictionaryElements.append(addressComponentsElement.toDictionary())
			}
			dictionary["address_components"] = dictionaryElements
		}
		if adrAddress != nil{
			dictionary["adr_address"] = adrAddress
		}
		if formattedAddress != nil{
			dictionary["formatted_address"] = formattedAddress
		}
		if formattedPhoneNumber != nil{
			dictionary["formatted_phone_number"] = formattedPhoneNumber
		}
		if geometry != nil{
            dictionary["geometry"] = geometry?.toDictionary()
		}
		if icon != nil{
			dictionary["icon"] = icon
		}
		if id != nil{
			dictionary["id"] = id
		}
		if internationalPhoneNumber != nil{
			dictionary["international_phone_number"] = internationalPhoneNumber
		}
		if name != nil{
			dictionary["name"] = name
		}
		if openingHours != nil{
            dictionary["opening_hours"] = openingHours?.toDictionary()
		}
		if photos != nil{
			var dictionaryElements = [[String:Any]]()
            for photosElement in photos! {
				dictionaryElements.append(photosElement.toDictionary())
			}
			dictionary["photos"] = dictionaryElements
		}
		if placeId != nil{
			dictionary["place_id"] = placeId
		}
		if rating != nil{
			dictionary["rating"] = rating
		}
		if reference != nil{
			dictionary["reference"] = reference
		}
		if reviews != nil{
			var dictionaryElements = [[String:Any]]()
            for reviewsElement in reviews! {
				dictionaryElements.append(reviewsElement.toDictionary())
			}
			dictionary["reviews"] = dictionaryElements
		}
		if scope != nil{
			dictionary["scope"] = scope
		}
		if types != nil{
			dictionary["types"] = types
		}
		if url != nil{
			dictionary["url"] = url
		}
		if utcOffset != nil{
			dictionary["utc_offset"] = utcOffset
		}
		if vicinity != nil{
			dictionary["vicinity"] = vicinity
		}
		return dictionary
	}
}
