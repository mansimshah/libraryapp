class Api::V1::SessionsController < Devise::SessionsController

  skip_before_action :verify_signed_out_user, only: :destroy

  def create
    puts "===params====",params.inspect
    user = User.find_by_email(params[:email])
    puts "====user====",user.inspect

    respond_to do |format|
      if user && user.valid_password?(params[:password])
        format.json { render json: { message: "Login Successfully", token: user.authentication_token }}
      else
        format.json { render :json => "Invalid Credential".to_json }
      end
    end

  end

  def destroy
    puts "===params====",params.inspect
    user = User.find_by_email(params[:email])
    puts "====user====",user.inspect

    respond_to do |format|
      if user.present?
        sign_out(user)
        format.json { render json: { message: "Logout Successfully" }}
      else
        format.json { render :json => "Invalid Credential".to_json }
      end
    end

  end

end