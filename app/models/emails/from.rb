module Emails
  class From
    attr_accessor :address, :display_name

    def initialize(raw_email)
      @raw_email = raw_email
      process_raw_email
    end

    private

      def process_raw_email
        if (matches = @raw_email.match(/(.*)\<(.*)\>/))
          @display_name = matches[0]
          @address = matches[1]
        else
          @display_name = @raw_email
          @address = @raw_email
        end
      end
  end
end
