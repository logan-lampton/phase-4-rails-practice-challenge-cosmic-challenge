class MissionsController < ApplicationController

    # POST /missions
    # send back a response with the planet associated with the new Mission (contrary to convention, which normally dictates the response would include data about the mission that was created)
    def create
        mission = Mission.create(mission_params)
            if mission.valid?
                render json: mission.planet, status: :created
            else
                render json: { errors: mission.errors.full_messages }, status: :unprocessable_entity
            end
    end

    private

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end
end
