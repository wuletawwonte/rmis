# frozen_string_literal: true

class MemberMailer < ApplicationMailer
  def envited
    @proposal = params[:proposal]
    @member = params[:member]
    mail(to: @member.user.email, subject: "RMIS: Envitation to join a research team")
  end
end
