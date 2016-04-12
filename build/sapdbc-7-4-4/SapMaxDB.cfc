<cfcomponent extends="types.Driver" implements="types.IDatasource">
	
	<cfset fields=[]>
    
	<cfset this.className="com.sap.dbtech.jdbc.DriverSapDB">
	<cfset this.dsn="jdbc:sapdb://{host}:{port}/{database}">

	<cfset this.type.port=this.TYPE_FREE>
	<cfset this.value.host="localhost">
	<cfset this.value.port=3306>
	
	<cffunction name="onBeforeError" returntype="void" output="no">
		<cfargument name="cfcatch" required="true" type="struct">
	</cffunction>
    
	<cffunction name="onBeforeUpdate" returntype="void" output="no">
	</cffunction>
    
	<cffunction name="getName" returntype="string" output="no"
		hint="returns display name of the driver">
		<cfreturn "SAP MaxDB">
	</cffunction>
	
	<cffunction name="getDescription" returntype="string" output="no"
		hint="returns description for the driver">
		<cfreturn "MaxDB is an ANSI SQL-92 (entry level) compliant relational database management system (RDBMS) from SAP AG, which was also delivered by MySQL AB from 2003 to 2007. MaxDB is targeted for large SAP environments e.g. mySAP Business Suite and other applications that require enterprise-level database functionality.">
	</cffunction>
	
	<cffunction name="getFields" returntype="array" output="no"
		hint="returns array of fields">
		<cfreturn fields>
	</cffunction>
	
	<cffunction name="equals" returntype="boolean" output="false"
		hint="return if String class match this">
		<cfargument name="className"	required="true">
		<cfargument name="dsn"			required="true">
		<cfreturn this.className EQ arguments.className and this.dsn EQ arguments.dsn>
	</cffunction>
	
</cfcomponent>