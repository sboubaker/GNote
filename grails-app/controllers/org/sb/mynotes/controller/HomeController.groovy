package org.sb.mynotes.controller

import org.sb.mynotes.domain.Comment
import org.sb.mynotes.domain.Note



class HomeController {



	def index = {
		redirect(action: "show", params: params)
	}

	def show = {
		if(!params.id){
			def noteInstance = Note.get(Note.count())
			noteInstance.views++
			noteInstance.save();
			[noteInstance: noteInstance]
		}else{

			def noteInstance = Note.get(params.id)
			if (!noteInstance) {
				redirect(action: "index")
			}
			else {
				noteInstance.views++
				noteInstance.save();
				[noteInstance: noteInstance]
			}
		}
	}
}
