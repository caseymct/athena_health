module AthenaHealth
  class EncounterStatus < BaseModel
    attribute :receivedtranscriptioncount, Integer
    attribute :receivedtranscriptions, Array
    attribute :closedencounter, Boolean
    attribute :iswaitingfortranscription, Boolean

    def should_lock
      receivedtranscriptioncount == 0 && !iswaitingfortranscription
    end

    def is_locked_and_waiting
      receivedtranscriptioncount == 0 && iswaitingfortranscription
    end

    def has_received_transcriptions
      receivedtranscriptioncount > 0 && !iswaitingfortranscription
    end
  end
end