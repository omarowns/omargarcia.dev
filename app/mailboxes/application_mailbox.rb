class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing ConversationMailbox::MATCHER => :conversation
  routing JobsMailbox::MATCHER => :jobs
  routing ReplyMailbox::MATCHER => :reply
  routing :all => :conversation

  private

  def author
    @author ||= if (user = User.find_by(email: from.address))
                  user
                else
                  contact = Contact.where(email: from.address).first_or_initialize
                  contact.update(name: from.display_name)
                  contact
                end
  end

  def from
    @from ||= Emails::From.new(mail.from.first)
  end

  def body
    if mail.multipart? && mail.html_part
      process_html
    elsif mail.multipart? && mail.text_part
      mail.text_part.body.decoded
    else
      mail.decoded
    end
  end

  def process_html
    document = Nokogiri::HTML(mail.html_part.body.decoded)

    attachments.map do |attachment_hash|
      attachment = attachment_hash[:original]
      blob = attachment_hash[:blob]

      if attachments.content_id.present?
        content_id = attachment.content_id[1..-1]
        element = document.at_css "img[src='cid:#{content_id}']"

        element.replace "<action-text-attachment sgid=\"#{blob.to_signed_global_id}\"></action-text-attachment>"
      end
    end

    document.at_css("body").inner_html.encode('utf-8')
  end

  def attachments
    @_attachments ||= mail.attachments.map do |attachment|
      blob = ActiveStorage::Blob.create_after_upload!(
        io: StringIO.new(attachment.body.to_s),
        filename: attachment.filename,
        content_type: attachment.content_type
      )
      { original: attachment, blob: blob }
    end
  end
end
