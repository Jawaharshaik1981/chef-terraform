# frozen_string_literal: true

module R18n
  module Locales
    # German locale
    class De < Locale
      set(
        title: 'Deutsch',

        wday_names: %w[Sonntag Montag Dienstag Mittwoch Donnerstag Freitag
                       Samstag],
        wday_abbrs: %w[So Mo Di Mi Do Fr Sa],

        month_names: %w[Januar Februar März April Mai Juni Juli August
                        September Oktober November Dezember],
        month_abbrs: %w[Jan. Feb. Mär. Apr. Mai. Jun. Jul. Aug. Sep. Okt.
                        Nov. Dez.],

        time_am:     'vormittags',
        time_pm:     'nachmittags',
        date_format: '%d.%m.%Y',
        full_format: '%-d. %B',

        number_decimal: ',',
        number_group:   '.'
      )
    end
  end
end
