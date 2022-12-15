class PartnerMailer < ApplicationMailer
  def partner_mail(partner)
    @partner = partner
    @mother = User.find(partner.mother_id)
    @certification_code = partner.certification_code
    @partner_email = partner.email

    mail to: @partner_email, subject: "招待メール"
  end
end
