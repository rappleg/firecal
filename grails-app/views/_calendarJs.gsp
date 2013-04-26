<script type="text/javascript">

	$(document).ready(function() {

		$('a.decrementYear').click(function() {
			changeFilter(currentYear() - 1, selectedPeriod() == 'year' ? null : currentMonth());
		});

		$('a.decrementMonth').click(function() {
			var offset = selectedPeriod() == 'three-months' ? 3 : 1;
			var month = currentMonth() == 0 ? 11 : currentMonth() - offset;
			changeFilter(month == 11 ? currentYear() - 1 : currentYear(), month);
		});

		$('a.incrementMonth').click(function() {
			var offset = selectedPeriod() == 'three-months' ? 3 : 1;
			var month = (currentMonth() + offset) % 12;
			changeFilter(month == 0 || month < offset ? currentYear() + 1 : currentYear(), month);
		});

		$('a.incrementYear').click(function() {
			changeFilter(currentYear() + 1, selectedPeriod() == 'year' ? null : currentMonth());
		});

		$('a.crew-one').click(function() {
			var currentCrewSelected = $('#crewSelected').attr("val");
			enable('crew-one');
			currentCrewSelected == "crew-one" ? toggleDisabled('crew-two') : disable('crew-two');
			currentCrewSelected == "crew-one" ? toggleDisabled('crew-three') : disable('crew-three');
			$('#crewSelected').attr("val", "crew-one");
		});

		$('a.crew-two').click(function() {
			var currentCrewSelected = $('#crewSelected').attr("val");
			currentCrewSelected == "crew-two" ? toggleDisabled('crew-one') : disable('crew-one');
			enable('crew-two');
			currentCrewSelected == "crew-two" ? toggleDisabled('crew-three') : disable('crew-three');
			$('#crewSelected').attr("val", "crew-two");
		});

		$('a.crew-three').click(function() {
			var currentCrewSelected = $('#crewSelected').attr("val");
			currentCrewSelected == "crew-three" ? toggleDisabled('crew-one') : disable('crew-one');
			currentCrewSelected == "crew-three" ? toggleDisabled('crew-two') : disable('crew-two');
			enable('crew-three');
			$('#crewSelected').attr("val", "crew-three");
		});

		$('a.displayMonth').click(function() {
			changePeriod(currentYear(), currentMonth(), 'month');
		});

		$('a.displayThreeMonths').click(function() {
			changePeriod(currentYear(), currentMonth(), 'three-months');
		});

		$('a.displayYear').click(function() {
			changePeriod(currentYear(), null, 'year');
		});

	});

	function currentYear() {
		var yearVal = $('#currentYear').attr("value");
		return yearVal == '' ? null : parseInt(yearVal);
	}

	function currentMonth() {
		var monthVal = $('#currentMonth').attr("value");
		return monthVal == '' ? null : parseInt(monthVal);
	}

	function selectedPeriod() {
		return $('#selectedPeriod').attr("value");
	}

	function changeFilter(year, month) {
		jQuery.ajax({
			url:'<g:createLink controller="calendar" action="changeFilter" />',
			data:{
				year:year,
				month:month,
				period:selectedPeriod()
			},
			success:function(data, textStatus) {
				$('#calendarContainer').html(data);
			}
		});
	}

	function changePeriod(year, month, period) {
		$('#selectedPeriod').attr("value", period);
		jQuery.ajax({
			url:'<g:createLink controller="calendar" action="changePeriod" />',
			data:{
				year:year,
				month:month,
				period:period
			},
			success:function(data, textStatus) {
				$('#calendarContainer').html(data);
			}
		});
	}

	function enable(crewClass) {
		$(".calendarDay."+crewClass+".disabled").removeClass("disabled");
	}

	function disable(crewClass) {
		$(".calendarDay."+crewClass+":not(:has(.disabled))").addClass("disabled");
	}

	function toggleDisabled(crewClass) {
		$(".calendarDay."+crewClass).toggleClass("disabled");
	}

</script>