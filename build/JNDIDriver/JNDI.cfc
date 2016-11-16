<cfcomponent extends="types.Driver" output="false" implements="types.IDatasource">
	<cfset this.className="org.goochfriend.jndidriver.JNDIDriver" />
	<cfset this.dsn="java:jndi:{jndiname}" />>
		
        <cfset this.type.port=this.TYPE_HIDDEN>
        <cfset this.type.host=this.TYPE_HIDDEN>
        <cfset this.type.database=this.TYPE_HIDDEN>
	
	<cfset fields=array(
                field("JNDI Object Name","jndiname","java:comp/env/jdbc/name",true,"JNDI name to lookup")
	)/>
	
	<cfset data=struct()>
	
	<cffunction name="onBeforeUpdate" returntype="void" output="no">
	</cffunction>
	
	<cffunction name="getFields" returntype="array" output="no"
		hint="returns array of fields">
		<cfreturn fields>
	</cffunction>
	
	<cffunction name="getName" returntype="string" output="no"
		hint="returns display name of the driver">
		<cfreturn "JNDI - JDBC Driver wrapping JNDI" />
	</cffunction>
	
	<cffunction name="getDescription" returntype="string" output="no"
		hint="returns description for the driver">
		<cfreturn "JDBC Driver wrapping JNDI" />
	</cffunction>

	<cffunction name="equals" returntype="boolean" output="false"
		hint="return if String class match this">
		
		<cfargument name="className"	required="true">
		<cfargument name="dsn"			required="true">
		
		<cfreturn this.className EQ arguments.className and this.dsn EQ arguments.dsn />
	</cffunction>
	
</cfcomponent>
