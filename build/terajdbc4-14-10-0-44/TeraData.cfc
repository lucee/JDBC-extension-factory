component extends="types.Driver" implements="types.IDatasource" {

	this.className="com.teradata.jdbc.TeraDriver";
	this.dsn="jdbc:teradata://{host}";
		
	this.type.port=this.TYPE_FREE;
	this.type.database=this.TYPE_FREE;
	this.value.host="";
	this.value.port=1025;
	
	
	fields=[

		field("Charset","CHARSET","UTF8",false,"Character set for a particular session to the Teradata Database. The supported character sets include:
			ASCII, EBCDIC037_0E, EBCDIC273_0E, EBCDIC277_0E, HANGULEBCDIC933_1II, HANGULKSC5601_2R4, KANJIEBCDIC5026_0I, KANJIEBCDIC5035_0I,
			KANJIEUC_0U, KANJISJIS_0S, LATIN1_0A, LATIN9_0A, LATIN1252_0A, SCHEBCDIC935_2IJ, SCHGB2312_1T0, TCHBIG5_1R0, TCHEBCDIC937_3IB, UTF8, UTF16"),


	];
	
	data={};

	public function customParameterSyntax() {
		return {leadingdelimiter:'/',delimiter:'/',separator:'='};
	}
	
	public void function onBeforeUpdate() {
		//form.custom_DatabaseName=form.database;
	}
	
	/**
	* returns array of fields
	*/
	public array function getFields() {
		return fields;
	}

	/**
	* returns display name of the driver
	*/
	public string function getName()  output="no" {
		return "Teradata Database";
	}

	/**
	* returns description for the driver
	*/
	public string function getDescription()   output="no" {
		return "Designed to deliver high performance, diverse queries, in-database analytics and sophisticated workload management, the Teradata Database supports and enables all Teradata Data Warehouse solutions. The Teradata Database outperforms all other vendor analytics solutions and will continue to support your analytics even with a changing competitive landscape or industry advances. With a Teradata Database driven warehouse, you can respond to changing and complex business requirements with greater speed and agility.";
	}

	/**
	* return if String class match this
	*/
	public boolean function equals(required className, required dsn) output="false" {
		return this.className EQ arguments.className;
	}
}