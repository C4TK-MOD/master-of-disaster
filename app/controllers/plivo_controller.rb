class PlivoController < ApplicationController
  require 'plivo_messenger'
  
  def send_msg

    render :text => PlivoMessenger.send_msg("12053129898", "This is another test.")
  end
end
