class BreastfeedingsController < ApplicationController

    def index
        @baby = Baby.find params[:baby_id]

        @breastfeedings = @baby.breastfeedings.order("date DESC")
        @today = @breastfeedings.where(:date => Time.now.midnight)
        @breastfeedings_last = @baby.breastfeedings.order("date DESC").limit(1)
    end

    def new
        @baby = Baby.find params[:baby_id]
        @breastfeeding = Breastfeeding.new
    end

    def create
        @baby = Baby.find params[:baby_id]
        @breastfeeding = Breastfeeding.new(breastfeeding_params)

        @breastfeeding.baby = @baby 

        respond_to do |format|
            if @breastfeeding.save
                format.html { redirect_to baby_breastfeeding_path(@baby, @breastfeeding), notice: 'Tu registro de alimentacion a tu bebe ha sido guardado con exito' }
            else
                format.html { render :new }
            end
        end
    end

    def show
        @baby = Baby.find params[:baby_id]
        @breastfeeding = Breastfeeding.find(params[:id])
    end

    def edit
        @baby = Baby.find params[:baby_id]
        @breastfeeding = Breastfeeding.find params[:id]
    end

    def update
        @baby = Baby.find params[:baby_id]
        @breastfeeding = Breastfeeding.find params[:id]

        respond_to do |format|
            if @breastfeeding.update(breastfeeding_params.merge(baby: @baby))
                format.html { redirect_to baby_breastfeeding_path(@baby, @breastfeeding), notice: 'El registro ha sido actualizado con exito' }
            else
                format.html { render :edit }
            end
        end
    end


    
    private
    def breastfeeding_params
        params.require(:breastfeeding).permit(:date, :quantity, :length, :baby_id)
    end


end
