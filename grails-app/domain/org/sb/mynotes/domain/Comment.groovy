package org.sb.mynotes.domain

class Comment {
	
	String username
	String text
	
	static belongsTo = [notes:Note]
	
    static constraints = {
		username(blank:false)
		text(blank:false)
    }
}
