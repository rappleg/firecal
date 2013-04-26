<g:each in="['Sun','Mon','Tue','Wed','Thu','Fri','Sat']">
	<div class="calendarDayTitle">
		${it}
	</div>
</g:each>
<g:each in="${calendar}" var="dayMap">
	<g:set var="dayStatus" value="" />
	<g:if test="${dayMap.day == today}">
		<g:set var="dayStatus" value="${dayStatus} today" />
	</g:if>
	<g:if test="${dayMap.day.month != month.value}">
		<g:set var="dayStatus" value="${dayStatus} notThisMonth" />
	</g:if>
	<g:if test="${dayMap.work}">
		<g:set var="dayStatus" value="${dayStatus} ${dayMap.work}" />
	</g:if>
	<div class="calendarDay${dayStatus}">
		<div class="calendarDayText">
			${dayMap.day.date}
		</div>
	</div>
</g:each>