# frozen_string_literal: true

module R18n
  module Locales
    # Portuguese locale
    class Pt < Locale
      set(
        title: 'Português',

        wday_names: %w[domingo segunda-feira terça-feira quarta-feira
                       quinta-feira sexta-feira sábado],
        wday_abbrs: %w[dom seg ter qua qui sex sab],

        month_names:      %w[janeiro fevereiro março abril maio junho julho
                             agosto setembro outubro novembro dezembro],
        month_abbrs:      %w[jan fev mar abr mai jun jul ago set out nov dez],
        month_standalone: %w[Janeiro Fevereiro Março Abril Maio Junho Julho
                             Agosto Setembro Outubro Novembro Dezembro],

        date_format: '%d/%m/%Y',
        full_format: '%d de %B',
        year_format: '_ de %Y',

        number_decimal: ',',
        number_group:   '.'
      )
    end
  end
end
