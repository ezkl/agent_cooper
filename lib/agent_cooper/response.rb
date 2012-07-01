module AgentCooper
  class Response

    include Virtus

    attribute :response, Object, :accessor => :protected

    # @api public
    def body
      response.body
    end

    # @api public
    def to_hash(options = {})
      AgentCooper::Utils::Hash.from_xml(xml, options)
    end

    # @api public
    def code
      response.code
    end

    # @api public
    def valid?
      code == 200
    end

    # @api public
    def xml
      @xml ||= Nokogiri::XML(body)
    end

  end
end
