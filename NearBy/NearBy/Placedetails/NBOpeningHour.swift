import Foundation


class NBOpeningHour: NSObject
{

	var openNow: Bool?
	var periods: [NBPeriod]?
	var weekdayText: [String]?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		openNow = dictionary["open_now"] as? Bool
		//periods = [NBPeriod]()
		if let periodsArray = dictionary["periods"] as? [[String:Any]]{
			for dic in periodsArray
            {
                let value: NBPeriod = NBPeriod(fromDictionary: dic)
				periods?.append(value)
			}
		}
		weekdayText = dictionary["weekday_text"] as? [String]
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if openNow != nil{
			dictionary["open_now"] = openNow
		}
		if periods != nil{
			var dictionaryElements = [[String:Any]]()
            for periodsElement in periods!
            {
				dictionaryElements.append(periodsElement.toDictionary())
			}
			dictionary["periods"] = dictionaryElements
		}
		if weekdayText != nil{
			dictionary["weekday_text"] = weekdayText
		}
		return dictionary
	}
}
