package org.sb.mynotes.controller

import org.sb.mynotes.domain.Note



class NoteController {

	def beforeInterceptor = [action:this.&auth]
	
	  def auth() {
		if(!session.user) {
		  redirect(controller:"user", action:"login")
		  return false
		}
	  }
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [noteInstanceList: Note.list(params), noteInstanceTotal: Note.count()]
    }

    def create = {
        def noteInstance = new Note()
        noteInstance.properties = params
        return [noteInstance: noteInstance]
    }

    def save = {
        def noteInstance = new Note(params)
        if (noteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'note.label', default: 'Note'), noteInstance.id])}"
            redirect(action: "show", id: noteInstance.id)
        }
        else {
            render(view: "create", model: [noteInstance: noteInstance])
        }
    }

    def show = {
        def noteInstance = Note.get(params.id)
        if (!noteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), params.id])}"
            redirect(action: "list")
        }
        else {
            [noteInstance: noteInstance]
        }
    }

    def edit = {
        def noteInstance = Note.get(params.id)
        if (!noteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [noteInstance: noteInstance]
        }
    }

    def update = {
        def noteInstance = Note.get(params.id)
        if (noteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (noteInstance.version > version) {
                    
                    noteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'note.label', default: 'Note')] as Object[], "Another user has updated this Note while you were editing")
                    render(view: "edit", model: [noteInstance: noteInstance])
                    return
                }
            }
            noteInstance.properties = params
            if (!noteInstance.hasErrors() && noteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'note.label', default: 'Note'), noteInstance.id])}"
                redirect(action: "show", id: noteInstance.id)
            }
            else {
                render(view: "edit", model: [noteInstance: noteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def noteInstance = Note.get(params.id)
        if (noteInstance) {
            try {
                noteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'note.label', default: 'Note'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'note.label', default: 'Note'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), params.id])}"
            redirect(action: "list")
        }
    }
}
