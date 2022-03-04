# frozen_string_literal: true

class OnboardingWizardParser < BaseParser
  def wizards
    json_response['values'].map { |attributes| Models::OnboardingWizard.new(attributes) }
  end
end
