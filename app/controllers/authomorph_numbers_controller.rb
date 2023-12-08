require_relative '../helpers/authomorph_numbers_helper.rb'

class AuthomorphNumbersController < ApplicationController
  include AuthomorphNumbersHelper
  def input
  end

  def view
    n = params[:n]
    if !params[:n].scan(/[^+\d|\-]/).empty?
      @error = 'Input contains letters'
    elsif n.to_i <= 0
      @error = 'N <= 0'
    end
    n = n.to_i
    @results = ((1..n).select { |i| authomorph_number?(i) }).to_a
    respond_to do |format|
      format.html
      format.json do
        render json:
          {n: n, results: @results, error: @error}
        end
      end 
  end
end
