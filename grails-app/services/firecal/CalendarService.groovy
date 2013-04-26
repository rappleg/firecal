package firecal

import java.text.SimpleDateFormat

class CalendarService {

	static Date TODAY = new Date().clearTime()

	def currentMonth() {
		[period: 'month'] << calendarForYearAndMonth(TODAY.year, TODAY.month)
	}

	def calendarForYearAndMonth(year, month) {
		def calYear = year == null ? TODAY.year : year
		def calMonth = month == null ? TODAY.month : month
		Date firstDayOfMonth = new Date(calYear, calMonth, 1)
		def monthMap = [value: calMonth, name: new SimpleDateFormat("MMMM").format(firstDayOfMonth)]
		boolean firstDayOfMonthIsSunday = true
		while (firstDayOfMonth.day != Calendar.SUNDAY - 1) {
			firstDayOfMonthIsSunday = false
			firstDayOfMonth += 1
		}
		Date firstSundayOfCalendar = firstDayOfMonthIsSunday ? firstDayOfMonth : firstDayOfMonth - 7

		Date startDateOfCrewOne = new Date().parse('yyyy/MM/dd', '2013/01/08')
		int offset = (startDateOfCrewOne - firstSundayOfCalendar).abs() % 9
		def workDays = ['crew-one', 'crew-three', 'crew-one', 'crew-two', 'crew-one', 'crew-two', 'crew-three', 'crew-two', 'crew-three']
		def calendar = []
		(1..41).find {
			def dayMap = [day: firstSundayOfCalendar++, work: workDays[offset]]
			offset = (offset + 1) % 9
			calendar << dayMap
			def nextDay = firstSundayOfCalendar + 1
			it >= 28 && ((firstSundayOfCalendar.date < 8 && firstSundayOfCalendar.day == Calendar.SATURDAY - 1)
							|| (nextDay.date < 8 && nextDay.day == Calendar.SUNDAY - 1))
		}
		calendar << [day: firstSundayOfCalendar, work: workDays[offset]]
		[calendar: calendar, today: TODAY, month: monthMap, year: calYear]
	}

	def calendarForThreeMonths(year, month) {
		def yearCalendar = (0..2).collect { index ->
			calendarForYearAndMonth(year, (month + index) % 12)
		}
		[period: 'three-months', year: year, yearCalendar: yearCalendar, currentMonth: month]
	}

	def calendarForYear(year) {
		def yearCalendar = (0..11).collect { month ->
			calendarForYearAndMonth(year, month)
		}
		[period: 'year', year: year, yearCalendar: yearCalendar, currentMonth: TODAY.month]
	}

}
