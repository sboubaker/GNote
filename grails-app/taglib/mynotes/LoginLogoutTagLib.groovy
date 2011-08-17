package mynotes

class LoginLogoutTagLib {
	def loginControl = {
		if(session.user){
		 out << """[${link(action:"logout", controller:"user"){"Logout"}}]"""
		} 
	  }
}
