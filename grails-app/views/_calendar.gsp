<!--start: Container -->
<div class="container-fluid">
	<g:hiddenField id="currentYear" name="year" value="${year}" />
	<g:hiddenField id="currentMonth" name="month" value="${month?.value == null ? currentMonth : month.value}" />
	<g:hiddenField id="selectedPeriod" name="selectedPeriod" value="${period}" />
	<g:hiddenField id="crewSelected" name="crew" value="none" />
	<!-- start: Row -->
		<div class="hidden-phone">
			<div class="row-fluid calendarOptions">
				<div class="span3 calendarFilter crewSelector">
					<g:render template="/selectCrew" />
				</div>
				<div class="span6 calendarFilter dateSelector">
					<g:render template="/selectDate" />
				</div>
				<div class="span3 calendarFilter periodSelector">
					<g:render template="/selectPeriod" />
				</div>
			</div>
		</div>
		<div class="visible-phone">
			<div class="row-fluid calendarOptions">
				<div class="span6 calendarFilter crewSelector">
					<g:render template="/selectCrew" />
				</div>
				<div class="span6 calendarFilter periodSelector">
					<g:render template="/selectPeriod" />
				</div>
			</div>
			<div class="row-fluid calendarOptions">
				<div class="span12 calendarFilter dateSelector">
					<g:render template="/selectDate" />
				</div>
			</div>
		</div>

	<g:set var="displayPeriod" value="${period == 'three-months' ? 'year' : period}"/>
	<div id="calendarWrapper-${displayPeriod}">
		<g:render template="/${displayPeriod}Calendar" />
	</div>
</div>

<g:render template="/calendarJs" />

%{--<script src="http://subtlepatternsjs.herokuapp.com/subtlepatterns.js"></script>--}%