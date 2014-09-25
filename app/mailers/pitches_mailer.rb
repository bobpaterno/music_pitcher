class PitchesMailer < ActionMailer::Base
  def mail_pitch(pitch)
    @pitch = pitch
    mail to: pitch.email, subject: pitch.subject
  end
end