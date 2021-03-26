<cfoutput>
<div style="border-radius: 5px; border: 1px solid blue" class="mt5">

	<!--- Header Panel --->
	<div class="pl10 pr10 pt5" style="border-bottom:1px solid blue; background-color: ##dde1e6">
		<div class="floatRight">
			<button
				type="button"
				title="Reload Report"
				id="cbd-buttonRefreshProfilers"
				onClick="cbdGetProfilerReport( '#args.profiler.id#' )"
			>
				<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
				</svg>
			</button>
		</div>

		<h4>
			<!--- Back --->
			<div>
				<button
					type="button"
					title="Back to profilers"
					id="cbd-buttonBackToProfilers"
					onClick="cbdRefreshProfilers()"
				>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 19l-7-7 7-7m8 14l-7-7 7-7" />
					</svg>
				</button>

				<!--- Info --->
				#args.profiler.requestData.method#
				<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
				</svg>
				#args.profiler.fullUrl#

				<div
					class="floatRight mr5 <cfif args.profiler.executionTime gt args.debuggerConfig.slowExecutionThreshold>fw_badge_light<cfelse>fw_badge_dark</cfif>"
				>
					<cfif args.profiler.executionTime gt args.debuggerConfig.slowExecutionThreshold>
						<span class="fw_redText">
							#numberFormat( args.profiler.executionTime )# ms
						</span>
					<cfelse>
						#numberFormat( args.profiler.executionTime )# ms
					</cfif>
				</div>

			</div>

			<div class="mt5 ml30 size12">
				<strong>Event: </strong>
				<span class="textBlue mr5">
					#args.profiler.coldbox.event#
				</span>
			</div>

			<div style="display: flex;" class="mt10 ml30 size10 textMuted">

				<div>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
					</svg>
					#timeformat( args.profiler.timestamp, "hh:mm:ss.l tt" )#
					/ #dateformat( args.profiler.timestamp, "mmm.dd.yyyy" )#
				</div>

				<div class="ml10" title="Request Ip Address">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
					</svg>
					<a
						href="https://www.whois.com/whois/#args.profiler.ip#"
						target="_blank"
						title="Open whois for this ip address"
					>
						#args.profiler.ip#
					</a>
				</div>

				<div class="ml10" title="Server">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4" />
					</svg>
					#args.environment.inetHost#
				</div>

				<div class="ml10" title="Thread Info">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
					</svg>
					#args.profiler.threadInfo.replaceNoCase( "Thread", "" )#
				</div>

				<div class="ml10" title="Status Code">
					<cfif args.profiler.response.statusCode gte 200 && args.profiler.response.statusCode lt 300 >
						<span class="fw_greenText">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
								<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
							</svg>
							#args.profiler.response.statusCode#
						</span>
					<cfelseif args.profiler.response.statusCode gte 300 && args.profiler.response.statusCode lt 400 >
						<span class="fw_blueText">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
								<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
							</svg>
							#args.profiler.response.statusCode#
						</span>
					<cfelseif args.profiler.response.statusCode gte 400>
						<span class="fw_redText">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
								<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
							</svg>
							#args.profiler.response.statusCode#
						</span>
					</cfif>
				</div>

				<div class="ml10" title="Response Content Type">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
					</svg>
					#args.profiler.response.contentType.listFirst( ";" )#
				</div>
			</div>

		</h4>
	</div>

	<!--- Content Report --->
	<div class="p10">
		<cfif !structIsEmpty( args.profiler )>
			<!--- Details Row --->
			<div>
				<!--- **************************************************************--->
				<!--- Exception Data --->
				<!--- **************************************************************--->
				<cfif !args.profiler.exception.isEmpty()>
					<!--- Title --->
					<div class="fw_titles" onClick="fw_toggle( 'cbd-exceptionData' )">
						&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
							<path fill-rule="evenodd" d="M5.05 3.636a1 1 0 010 1.414 7 7 0 000 9.9 1 1 0 11-1.414 1.414 9 9 0 010-12.728 1 1 0 011.414 0zm9.9 0a1 1 0 011.414 0 9 9 0 010 12.728 1 1 0 11-1.414-1.414 7 7 0 000-9.9 1 1 0 010-1.414zM7.879 6.464a1 1 0 010 1.414 3 3 0 000 4.243 1 1 0 11-1.415 1.414 5 5 0 010-7.07 1 1 0 011.415 0zm4.242 0a1 1 0 011.415 0 5 5 0 010 7.072 1 1 0 01-1.415-1.415 3 3 0 000-4.242 1 1 0 010-1.415zM10 9a1 1 0 011 1v.01a1 1 0 11-2 0V10a1 1 0 011-1z" clip-rule="evenodd" />
						</svg>
						Exception Data
					</div>

					<div class="fw_debugContent" id="cbd-exceptionData">
						<table border="0" align="center" cellpadding="0" cellspacing="1" class="cbd-tables">
							<cfloop array="#args.profiler.exception.keyArray().sort( "textnocase" )#" item="thisItem" >
								<cfif !isSimpleValue( args.profiler.exception[ thisItem ] ) OR len( args.profiler.exception[ thisItem ] )>
									<tr>
										<th width="200" align="right">
											#thisItem# :
										</th>
										<td>
											<div class="cellScroller">
												<cfif isSimpleValue( args.profiler.exception[ thisItem ] )>
													<cfif thisItem eq "stacktrace">
														#new coldbox.system.web.context.ExceptionBean().processStackTrace( args.profiler.exception[ thisItem ] )#
													<cfelse>
														#args.profiler.exception[ thisItem ]#
													</cfif>
												<cfelse>
													<cfdump var="#args.profiler.exception[ thisItem ]#">
												</cfif>
											</div>
										</td>
									</tr>
								</cfif>
							</cfloop>
						</table>
					</div>
				</cfif>

				<!--- **************************************************************--->
				<!--- ColdBox Data --->
				<!--- **************************************************************--->
				<!--- Title --->
				<div class="fw_titles" onClick="fw_toggle( 'cbd-coldboxData' )">
					&nbsp;
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
						<path fill-rule="evenodd" d="M5.05 3.636a1 1 0 010 1.414 7 7 0 000 9.9 1 1 0 11-1.414 1.414 9 9 0 010-12.728 1 1 0 011.414 0zm9.9 0a1 1 0 011.414 0 9 9 0 010 12.728 1 1 0 11-1.414-1.414 7 7 0 000-9.9 1 1 0 010-1.414zM7.879 6.464a1 1 0 010 1.414 3 3 0 000 4.243 1 1 0 11-1.415 1.414 5 5 0 010-7.07 1 1 0 011.415 0zm4.242 0a1 1 0 011.415 0 5 5 0 010 7.072 1 1 0 01-1.415-1.415 3 3 0 000-4.242 1 1 0 010-1.415zM10 9a1 1 0 011 1v.01a1 1 0 11-2 0V10a1 1 0 011-1z" clip-rule="evenodd" />
					</svg>
					ColdBox Information
				</div>

				<div class="fw_debugContent" id="cbd-coldboxData">
					<table border="0" align="center" cellpadding="0" cellspacing="1" class="cbd-tables">
						<cfloop array="#args.profiler.coldbox.keyArray().sort( "textnocase" )#" item="thisItem" >
							<tr>
								<th width="200" align="right">
									#thisItem# :
								</th>
								<td>
									<div class="cellScroller">
										<cfif isSimpleValue( args.profiler.coldbox[ thisItem ] )>
											<cfif !isBoolean( args.profiler.coldbox[ thisItem ] ) && isJSON( args.profiler.coldbox[ thisItem ] )>
												<cfdump
													var="#deserializeJSON( args.profiler.coldbox[ thisItem ] )#"
													label="Click to expand..."
													expand="false">
											<cfelse>
												<cfif len( args.profiler.coldbox[ thisItem ] )>
													#args.profiler.coldbox[ thisItem ]#
												<cfelse>
													<span class="textMuted">
														n/a
													</span>
												</cfif>
											</cfif>
										<cfelse>
											<cfdump
												var="#args.profiler.coldbox[ thisItem ]#"
												label="Click to expand..."
												expand="false">
										</cfif>
									</div>
								</td>
							</tr>
						</cfloop>
					</table>
				</div>

				<!--- **************************************************************--->
				<!--- Request Data --->
				<!--- **************************************************************--->
				<!--- Title --->
				<div class="fw_titles" onClick="fw_toggle( 'cbd-requestInfo' )">
					&nbsp;
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
						<path fill-rule="evenodd" d="M5.05 3.636a1 1 0 010 1.414 7 7 0 000 9.9 1 1 0 11-1.414 1.414 9 9 0 010-12.728 1 1 0 011.414 0zm9.9 0a1 1 0 011.414 0 9 9 0 010 12.728 1 1 0 11-1.414-1.414 7 7 0 000-9.9 1 1 0 010-1.414zM7.879 6.464a1 1 0 010 1.414 3 3 0 000 4.243 1 1 0 11-1.415 1.414 5 5 0 010-7.07 1 1 0 011.415 0zm4.242 0a1 1 0 011.415 0 5 5 0 010 7.072 1 1 0 01-1.415-1.415 3 3 0 000-4.242 1 1 0 010-1.415zM10 9a1 1 0 011 1v.01a1 1 0 11-2 0V10a1 1 0 011-1z" clip-rule="evenodd" />
					</svg>
					Request
				</div>

				<!--- Panel --->
				<div class="fw_debugContent" id="cbd-requestInfo">
					<table border="0" align="center" cellpadding="0" cellspacing="1" class="cbd-tables">
						<tr>
							<th width="200">HTTP Method:</th>
							<td>#args.profiler.requestData.method#</td>
						</tr>
						<cfif !isNull( args.profiler.requestData.content )>
							<tr>
								<th width="200">HTTP Content:</th>
								<td>
									<div class="cellScroller">
										<cfif isSimpleValue( args.profiler.requestData.content )>
											<cfif len( args.profiler.requestData.content )>
												#args.profiler.requestData.content#
											<cfelse>
												<em>empty</em>
											</cfif>
										<cfelse>
											<cfdump var="#args.profiler.requestData.content#">
										</cfif>
									</div>
								</td>
							</tr>
						</cfif>
						<cfloop collection="#args.profiler.requestData.headers#" item="thisHeader" >
							<tr>
								<th width="200">
									Header-#thisHeader#:
								</th>
								<td>
									<div class="cellScroller">
										#replace( args.profiler.requestData.headers[ thisHeader ], ";", "<br>", "all" )#
									</div>
								</td>
							</tr>
						</cfloop>
					</table>
				</div>

				<!--- **************************************************************--->
				<!--- Profiling Timers --->
				<!--- **************************************************************--->
				#renderView(
					view : "main/partials/debugTimers",
					module : "cbdebugger",
					args : {
						timers : args.profiler.timers,
						debuggerConfig : args.debuggerConfig,
						executionTime : args.profiler.executionTime
					},
					prePostExempt : true
				)#

				<!--- **************************************************************--->
				<!--- Tracers --->
				<!--- **************************************************************--->
				#renderView(
					view : "main/panels/tracersPanel",
					module : "cbdebugger",
					args : {
						tracers : args.profiler.tracers
					},
					prePostExempt : true
				)#
			</div>
		<cfelse>
			<div class="textRed">
				Profiler with ID: #rc.id# not found!
			</div>
		</cfif>
	</div>

	<!--- Scroll to top --->
	<div class="mt10 mb10 textCenter">
		<button
			type="button"
			title="Got to top of report"
			onClick="cbdScrollToProfilerReport()"
		>
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
				<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
			</svg>
		</button>
	</div>
</div>
</cfoutput>