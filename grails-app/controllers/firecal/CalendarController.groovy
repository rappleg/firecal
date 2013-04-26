package firecal

class CalendarController {

	def calendarService

	def changeFilter() {
		displayCalendarUpdates()
	}

	def changePeriod() {
		displayCalendarUpdates()
	}

	private void displayCalendarUpdates() {
		def period = params.period ?: 'month'
		def calendarModel
		if (period == 'month') {
			calendarModel = calendarService.calendarForYearAndMonth(params.int('year'), params.int('month'))
		} else if (period == 'three-months') {
			calendarModel = calendarService.calendarForThreeMonths(params.int('year'), params.int('month'))
		} else if (period == 'year') {
			calendarModel = calendarService.calendarForYear(params.int('year'))
		}
		render(template: "/calendar", model: [period: period] << calendarModel)
	}

}
