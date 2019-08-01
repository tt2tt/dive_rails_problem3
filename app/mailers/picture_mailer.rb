class PictureMailer < ApplicationMailer
  def contribution_mail(picture)
    @contribution = picture

    mail to: picture.user.email, subject: "ご投稿の確認メール"
  end
end
