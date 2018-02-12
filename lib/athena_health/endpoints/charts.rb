module AthenaHealth
  module Endpoints
    module Charts

      def add_external_dictation_message(practice_id:, encounter_id:, encounter_section:, field:,
                                         total_message_count:, transcription_text:, params: {})
        @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/externaldictationmessage",
          method: :post,
          body: params.merge!(
            encountersection: encounter_section,
            field: field,
            totalmessagecount: total_message_count,
            transcriptiontext: transcription_text
          )
        )
      end

      def encounter_dictation_status(practice_id:, encounter_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/dictationstatus",
          method: :get
        )

        EncounterStatus.new(response)
      end

      def start_external_dictation(practice_id:, encounter_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/startexternaldictation",
          method: :post,
          body: params
        )
      end
    end
  end
end