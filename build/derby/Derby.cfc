<cfcomponent extends="types.Driver" implements="types.IDatasource">
	<cfset fields=[]>
	<cfset this.type.host=this.TYPE_HIDDEN>
	
	<cfset this.dsn="jdbc:derby:{database}"><!--- jdbc:derby:databaseName[;URLAttributes=value[;...]] --->
	<cfset this.className="org.apache.derby.jdbc.EmbeddedDriver">

	<cfset SLASH=struct(
		'/':'\',
		'\':'/'
	)>
	
	
	<cffunction name="onBeforeUpdate" returntype="void" output="no">
		<!--- add the right file delimiter --->
		<cfset form.custom_path=replace(
						form.custom_path,
						SLASH[server.separator.file],
						server.separator.file,
						'all')>
		<cfif right(form.custom_path,1) NEQ server.separator.file>
			<cfset form.custom_path=form.custom_path&server.separator.file>
		</cfif>
		
		<!--- make sure relative path and path with placeholder are working --->
		<cfif not directoryExists(form.custom_path)>
			<cfset local._custom_path=expandPath(form.custom_path)>
			<cfif directoryExists(local._custom_path)>
				<cfset form.custom_path=local._custom_path>
			</cfif>
		</cfif>
		
		<!--- if parent exist, create it --->
		<cfif not directoryExists(form.custom_path)>
			<cfset var parent=mid(form.custom_path,1,len(form.custom_path)-1)>
			<cfset parent=getDirectoryFromPath(parent)>
			<!--- <cfif directoryExists(parent)>
				<cfdirectory directory="#form.custom_path#" action="create" mode="777">
			<cfelse>
				<cfthrow message="directory [#form.custom_path#] doesn't exist">
			</cfif>--->
		</cfif>
		
	</cffunction>
	
	<cffunction name="getName" returntype="string"  output="no"
		hint="returns display name of the driver">
		<cfreturn "Apache Derby">
	</cffunction>
	
	<cffunction name="getDescription" returntype="string"  output="no"
		hint="returns description for the driver">
		<cfreturn "Apache Derby, an Apache DB subproject, is an open source relational database implemented entirely in Java and available under the Apache License, Version 2.0.">
	</cffunction>
	
	<cffunction name="getFields" returntype="array"  output="no"
		hint="returns array of fields">
		<cfreturn fields>
	</cffunction>
	
</cfcomponent>