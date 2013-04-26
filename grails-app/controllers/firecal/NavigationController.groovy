package firecal

class NavigationController {

	def calendarService

	def home() {
		def calendarModel = calendarService.currentMonth()
		render(view: "home", model: calendarModel)
	}

}
