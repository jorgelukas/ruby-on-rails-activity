# A tarefinha é nesse arquivo
class ActivitiesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        # listar as atividades (variável activities)
        @activities = Activity.order(:due_date)
        # criar uma atividade (variável activity)
        @activity = Activity.new
    end
    
    def create
        #Crie uma atividade aqui
        @activity = Activity.new(activity_params)

        if @activity.save
          redirect_to activities_index_url
          #Envie uma mensagem com flash[:msg] contendo o alerta
          flash[:msg] = "Atividade criada."
        else
          render :new
        end

        
       
    end

    def destroy
        #Destrua uma atividade por id
        @activity = Activity.find(params[:id])
        @activity.destroy

        #Envie uma mensagem com flash[:msg] contendo o alerta
        flash[:msg] = "Atividade excluída com sucesso."
        
        redirect_to activities_index_url
    end

    private

    def activity_params
        #Defina os parâmetros de cada atividade em params
        params.require(:activity).permit(:name, :date, :description)
    end

    
end
