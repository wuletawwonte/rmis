# Preview all emails at http://localhost:3000/rails/mailers/member_mailer
class MemberMailerPreview < ActionMailer::Preview
  def envited
    MemberMailer.with(proposal: Proposal.first, member: Member.first).envited
  end
end
