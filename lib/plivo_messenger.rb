class PlivoMessenger
  require 'plivo'

  PLIVO = Plivo::RestAPI.new(ENV['PLIVO_AUTH_ID'], ENV['PLIVO_AUTH_TOKEN'])

  def self.send_msg(destination_number, text_msg)

    message_params = {
      src: "16066536847",
      dst: destination_number,
      text: text_msg,
    }

    PLIVO.send_message(message_params)
  end
end