package org.sb.mynotes.domain

class Note {
	
	String title
	String text
	Integer views
	Date dtcreate
	String lang
	
	static belongsTo = [user:User]
	
	static constraints = {
		title(blank:false)
		text(blank:false)
    }
	static mapping = {
		text type: 'text'
	 }
	 
}
