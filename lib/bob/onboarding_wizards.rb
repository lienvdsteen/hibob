# frozen_string_literal: true

module Bob
  class OnboardingWizards < API
    def self.all
      get('onboarding/wizards')
    end
  end
end
