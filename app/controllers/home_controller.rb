# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @display_message = 'Apoie a primeira equipe de Robótica de São Borja'
  end
end