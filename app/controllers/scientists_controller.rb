class ScientistsController < ApplicationController

    # GET /scientists
    def index
        scientists = Scientist.all
        render json: scientists, status: :ok
    end

    # GET /scientists/:id
    # SERIALIZE THE DATA TO SHOW AN ARRAY OF THEIR MISSIONS
    def show
        scientist = Scientist.find_by(id: params[:id])
            if scientist
                render json: scientist, status: :ok, serializer: ShowScientistSerializer
            else
                render json: { error: "Scientist not found" }, status: :not_found
            end
    end

    # POST /scientists
    # MAKE UPDATE TO HOW IT RENDERS
    def create
        scientist = Scientist.create(scientist_params)
            if scientist.valid?
                render json: scientist, status: :created, serializer: ShowScientistSerializer
            else
                render json: { errors: scientist.errors.full_messages }, status: :unprocessable_entity
            end
    end

    # PATCH /scientists/:id
    def update
        scientist = Scientist.find_by(id: params[:id])
            if scientist
                scientist.update(scientist_params)
                    if scientist.valid?
                        render json: scientist, status: :accepted
                    else
                        render json: { errors: scientist.errors.full_messages }, status: :unprocessable_entity
                    end
            else
                render json: { error: "Scientist not found" }, status: :not_found
            end
    end

    # DELETE /scientists/:id
    def destroy
        scientist = Scientist.find_by(id: params[:id])
            if scientist
                scientist.destroy
                render json: {}, status: :no_content
            else
                render json: { error: "Scientist not found" }, status: :not_found
            end
    end

    private

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

end
