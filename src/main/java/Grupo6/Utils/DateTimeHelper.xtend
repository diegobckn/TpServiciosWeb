package Grupo6.Utils

import java.util.Date

class DateTimeHelper {
	

	static DateTimeHelper _instance
	private new (){}
	
	public def static DateTimeHelper getInstance() {
		if (_instance == null){
			_instance = new DateTimeHelper() 
		}
		return _instance
	} 
	
	def int getCurrentHour () {
		return (new Date()).hours
	}
}