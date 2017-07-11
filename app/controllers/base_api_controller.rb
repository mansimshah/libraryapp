# class BaseApiController < ApplicationController
#   before_filter :authenticate_user_from_token!
#
#   private
#
#   def authenticate_user_from_token!
#
#     @user = User.where(authentication_token: params[:user_token],email: params[:user_email]).first
#     puts "=====user=====",@user.inspect
#
#     if @user.present?
#       sign_in(@user)
#     else
#       respond_to do |format|
#         msg = { :status => :unauthorized, :message => "Unauthorized User" }
#         format.json  { render :json => msg } # don't do msg.to_json
#       end
#     end
#
#   end
#
#   # def parse_request
#   #   @json = JSON.parse(request.body.read)
#   # end
#
# end