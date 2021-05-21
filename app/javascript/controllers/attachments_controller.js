import { Controller } from 'stimulus'
import Trix from 'trix'

export default class extends Controller {
  static targets = ['editor'];

  attach(event) {
    const { recordType, recordId } = event.target.dataset

    fetch(`/admin/${recordType}/${recordId}.json`)
      .then(response => response.json())
      .then(record => this.createAttachment(record))
      .catch(error => {
        console.log('error', error)
      })
  }

  createAttachment(record) {
    const editor = this.editorTarget.editor

    const attachment = new Trix.Attachment({
      sgid: record.sgid,
      content: record.content
    })

    editor.insertAttachment(attachment)
    editor.insertString(' ')
  }
}
