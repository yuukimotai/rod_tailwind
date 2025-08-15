class RodauthMailer < ApplicationMailer
  default to: -> { @rodauth.email_to }, from: -> { @rodauth.email_from }

  def verify_account(name, account_id, key)
    @rodauth = rodauth(name, account_id) { @verify_account_key_value = key }
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.verify_account_email_subject
  end

  def reset_password(name, account_id, key)
    @rodauth = rodauth(name, account_id) { @reset_password_key_value = key }
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.reset_password_email_subject
  end

  def verify_login_change(name, account_id, key)
    @rodauth = rodauth(name, account_id) { @verify_login_change_key_value = key }
    @account = @rodauth.rails_account
    @new_email = @account.login_change_key.login

    mail to: @new_email, subject: @rodauth.email_subject_prefix + @rodauth.verify_login_change_email_subject
  end

  def email_auth(name, account_id, key)
    @rodauth = rodauth(name, account_id) { @email_auth_key_value = key }
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.email_auth_email_subject
  end

  def unlock_account(name, account_id, key)
    @rodauth = rodauth(name, account_id) { @unlock_account_key_value = key }
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.unlock_account_email_subject
  end

  def reset_password_notify(name, account_id)
    @rodauth = rodauth(name, account_id)
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.reset_password_notify_email_subject
  end

  def password_changed(name, account_id)
    @rodauth = rodauth(name, account_id)
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.password_changed_email_subject
  end

  def otp_setup(name, account_id)
    @rodauth = rodauth(name, account_id)
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.otp_setup_email_subject
  end

  def otp_disabled(name, account_id)
    @rodauth = rodauth(name, account_id)
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.otp_disabled_email_subject
  end

  def otp_locked_out(name, account_id)
    @rodauth = rodauth(name, account_id)
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.otp_locked_out_email_subject
  end

  def otp_unlocked(name, account_id)
    @rodauth = rodauth(name, account_id)
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.otp_unlocked_email_subject
  end

  def otp_unlock_failed(name, account_id)
    @rodauth = rodauth(name, account_id)
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.otp_unlock_failed_email_subject
  end

  def webauthn_authenticator_added(name, account_id)
    @rodauth = rodauth(name, account_id)
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.webauthn_authenticator_added_email_subject
  end

  def webauthn_authenticator_removed(name, account_id)
    @rodauth = rodauth(name, account_id)
    @account = @rodauth.rails_account

    mail subject: @rodauth.email_subject_prefix + @rodauth.webauthn_authenticator_removed_email_subject
  end

  private

  # Default URL options are inherited from Action Mailer, but you can override them
  # ad-hoc by modifying the `rodauth.rails_url_options` hash.
  def rodauth(name, account_id, &block)
    instance = RodauthApp.rodauth(name).allocate
    instance.account_from_id(account_id)
    instance.instance_eval(&block) if block
    instance
  end
end
