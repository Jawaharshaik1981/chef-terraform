# frozen_string_literal: true

module R18n
  module Locales
    # Dutch locale
    class Nl < Locale
      set(
        title: 'Nederlands',

        wday_names: %w[zondag maandag dinsdag woensdag donderdag vrijdag
                       zaterdag],
        wday_abbrs: %w[zo ma di wo do vr za],

        month_names: %w[januari februari maart april mei juni juli augustus
                        september oktober november december],
        month_abbrs: %w[jan feb mrt apr mei jun jul aug sep okt nov dec],

        time_am:     "'s ochtends",
        time_pm:     "'s middags",
        date_format: '%d-%m-%Y',
        full_format: '%-d %B',

        number_decimal: ',',
        number_group:   '.'
      )
    end
  end
end
