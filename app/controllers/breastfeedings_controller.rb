class BreastfeedingsController < ApplicationController

    def index
        @breastfeedings = Breastfeeding.all
    end

    def new
        @breastfeeding = Breastfeeding.new
        @babies = Baby.all
    end

    def create
        @breastfeeding = Breastfeeding.new(breastfeeding_params)

        respond_to do |format|
            if @breastfeeding.save
                format.html { redirect_to @breastfeeding, notice: 'Tu registro de alimentacion a tu bebe ha sido guardado con exito' }
            else
                format.html { render :new }
            end
        end
    end

    def show
        @breastfeeding = Breastfeeding.find(params[:id])
    end





    private

    def breastfeeding_params
        params.require(:breastfeeding).permit(:date, :quantity, :length, :baby_id)
    end


end
