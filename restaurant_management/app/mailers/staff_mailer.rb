class StaffMailer < ActionMailer::Base
  default from: "smtp.sendgrid.net"
  include SendGrid
  sendgrid_category :use_subject_lines
  sendgrid_enable   :ganalytics, :opentrack

  def staff_email(staff)
    @staff = staff
    mail(to: @staff.email, subject: "Got new Staff")
  end
end
