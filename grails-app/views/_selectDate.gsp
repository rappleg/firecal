<div class="row-fluid">
	<g:if test="${period == 'year'}">
		<a class="decrementYear" href="javascript:void(0)">
			<div class="span4 filter year">
				<div class="arrow-left"></div>
				<div class="arrow-left"></div>
			</div>
		</a>
	</g:if>
	<g:else>
		<a class="decrementYear" href="javascript:void(0)">
			<div class="span2 filter year">
				<div class="arrow-left"></div>
				<div class="arrow-left"></div>
			</div>
		</a>
		<a class="decrementMonth" href="javascript:void(0)">
			<div class="span2 filter month">
				<div class="arrow-left"></div>
			</div>
		</a>
	</g:else>
	<div class="span4 filter date">
		${month?.name} &nbsp;${year + 1900}
	</div>
	<g:if test="${period == 'year'}">
		<a class="incrementYear" href="javascript:void(0)">
			<div class="span4 filter year">
				<div class="arrow-right"></div>
				<div class="arrow-right"></div>
			</div>
		</a>
	</g:if>
	<g:else>
		<a class="incrementMonth" href="javascript:void(0)">
			<div class="span2 filter month">
				<div class="arrow-right"></div>
			</div>
		</a>
		<a class="incrementYear" href="javascript:void(0)">
			<div class="span2 filter year">
				<div class="arrow-right"></div>
				<div class="arrow-right"></div>
			</div>
		</a>
	</g:else>
</div>