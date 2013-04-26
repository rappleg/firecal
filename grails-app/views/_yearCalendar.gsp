<g:each in="${yearCalendar}" var="monthCalendar" status="i">
	<g:if test="${i == 0 || i % 3 == 0}">
		<div class="row-fluid">
	</g:if>
	<div class="span4 calendarMonth">
		<div class="span12 monthTitle">
			${monthCalendar.month.name}
		</div>
		<g:render template="/monthCalendar" model="${monthCalendar}"/>
	</div>
	<g:if test="${(i + 1) % 3 == 0}">
		</div>
	</g:if>
</g:each>