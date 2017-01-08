class TicketReportMailer < ActionMailer::Base
  default from: 'support@dsalab.com'

  def report_email(user)
    include_pdf_attachment
    mail(
      to: user.email,
      body: "Thanks #{user.name} for the request. In the attachment you will see\n a PDF with the closed tickets of the current month",
      subject: "Closed Ticket #{Date.today.strftime('%B')}",
    )
  end

  private

  def include_pdf_attachment
    attachments["#{Date.today}.pdf"] = ReportClosedTickets.generate
  end
end
