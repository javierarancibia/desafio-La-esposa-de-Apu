class BabiesController < ApplicationController

    def index
        @babies = Baby.all
        @breastfeedings = Breastfeeding.all
    end


end