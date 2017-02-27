class BookMailer < ActionMailer::Base
  default from: "smtp.sendgrid.net"
  include SendGrid
  sendgrid_category :use_subject_lines
  sendgrid_enable   :ganalytics, :opentrack

  def book_email(target)
    @target = target
    mail to: @target.email, subject: t("dialog.new_dish")
  end
end
