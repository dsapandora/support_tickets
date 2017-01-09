# Create the report of the daily closed tickets
module ReportClosedTickets

  def self.generate
    ticket_list = Ticket.closed_this_month.map do |ticket|
      {
        id: ticket.id,
        question: ticket.question,
        customer_name: ticket.user.name,
        response_count: ticket.responses.count,
        # Asumming you last update in the ticket is when you close it
        created_at: ticket.created_at
      }
    end
    ticket_json = { tickets: ticket_list }
    create_pdf(ticket_json)
  end

  def self.create_pdf(ticket_json)
    pdf_sheet = PDFKit.new(render_content(ticket_json), margin_top: '1.25in', page_size: 'Letter')
    pdf_sheet.stylesheets << css_path
    # For test the file
    pdf_sheet.to_pdf
  end

  def self.render_content(values)
    render_haml('closed_this_month', values)
  end

  def self.render_haml(template_name, values)
    path = File.join(Rails.root, 'app', 'templates', "#{template_name}.html.haml")
    template = File.read(path)
    Haml::Engine.new(template).render(Object.new,values)
  end

  def self.current_path
    File.expand_path(File.dirname(__FILE__))
  end

  def self.css_path
    File.join(Rails.root, 'app', 'templates', 'tickets.css')
  end
end
