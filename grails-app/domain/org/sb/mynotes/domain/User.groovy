package org.sb.mynotes.domain

class User {
	
	String name
	String email
	String password
	static constraints = {
		email(blank:false)
		password(blank:false,password:true)
		name(blank:false)
    }
}
