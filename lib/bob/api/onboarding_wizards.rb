# frozen_string_literal: true

module Bob
  class OnboardingWizards < API
    def self.all
      response = get('onboarding/wizards')
      OnboardingWizardParser.new(response).wizards
    end
  end
end
