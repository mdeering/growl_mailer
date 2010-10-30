module Mail
  # The GrowlMailer is a bare bones mailer that does nothing but use Growl Notify to alert
  # to the fact a messages delivery attempt has happend
  class GrowlMailer
    require 'growl'

    attr_accessor :settings

    def initialize(values)
      puts values.inspect
      self.settings = {
        :icon    => 'Mail',
        :message => lambda { |mail| mail.subject },
        :title   => lambda { |mail| mail.destinations.join(", ") }
      }.merge!(values)
    end

    def deliver!(mail)
      options = options(mail)
      Growl.notify options.delete(:message), options
    end

    private

      def options(mail)
        {}.tap do |options|
          settings.each_pair { |key, value| options[key] = value.respond_to?(:call) ? value.call(mail) : value }
        end
      end

  end
end

ActionMailer::Base.add_delivery_method(:growl, Mail::GrowlMailer) if defined?(ActionMailer::Base)
