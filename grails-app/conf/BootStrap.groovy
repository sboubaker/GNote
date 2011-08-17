import java.util.Date

import org.sb.mynotes.domain.Note
import org.sb.mynotes.domain.User

class BootStrap {

    def init = { servletContext ->
		def admin=new User(name:"Ladmin",email:"admin@gmail.com",password:"admin")
		admin.save();
		def user=new User(name:"Eluser",email:"user@gmail.com",password:"user")
		user.save();
		def note=new Note(title:"Note One",lang:"FR",views:0,dtcreate:new Date(),user:user,text:"""
		-  Prendre en charge les évolutions du master
- Assurer le développement des évolutions
- Mener les projets pour intégrer les nouvelles fonctionnalités à la solution poste de travail et les évolutions majeures du master
- Assurer l'évolution de l'infrastructure poste de travail
- Prendre en charge l'intégration des applications (packaging MSI)
- Etre force de proposition dans le cadre des différents projets impactant le poste de travail (veille produits, test, benchmarking...)
		""")
		note.save();
		def note2=new Note(title:"Note Two",lang:"FR",views:0,dtcreate:new Date(),user:user,text:"""
		-  Prendre en charge les évolutions du master
- Etre force de proposition dans le cadre des différents projets impactant le poste de travail (veille produits, test, benchmarking...)
		""")
		note2.save();
    }
    def destroy = {
    }
}
