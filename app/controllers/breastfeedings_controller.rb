class BreastfeedingsController < ApplicationController

    def index
        @breastfeedings = Breastfeeding.all
    end

    def new
        @breastfeeding = Breastfeeding.new
        @babies = Baby.all
    end


end
