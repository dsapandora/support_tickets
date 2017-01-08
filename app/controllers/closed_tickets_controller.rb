class ClosedTicketsController < ApplicationController
  def send_report
    user = User.find(user_params[:user_id])
    TicketReportMailer.report_email(user).deliver!
  end

private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:closed_ticket).permit(:user_id)
  end
end
