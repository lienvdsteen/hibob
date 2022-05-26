# frozen_string_literal: true

class OnboardingWizardParser < BaseParser
  def wizards
    json_response['wizards'].map { |attributes| Models::OnboardingWizard.new(attributes) }
  end
end
