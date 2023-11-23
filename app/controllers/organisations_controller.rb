class OrganisationsController < ApplicationController

    def index
        if current_user.organisation_id != nil
            redirect_to overview_path
        else
            @Organisations = Organisation.all
        end
    end

    def create
        @organisation = Organisation.create(create_params)
        redirect_to root_path
    end

    def edit 
        @organisation = Organisation.find(params[:id])
    end

    def update
        @organisation = Organisation.update(params[:id], update_params)
        if @organisation.save
            redirect_to root_path
        else
            flash[:alert] = "User not created"
            render :new, status: :unprocessable_entity
          end
    end

    #Shows current users organisation
    def overview
        if current_user.organisation_id != nil
            @organisation = Organisation.find(current_user.organisation_id)
        else
            redirect_to root_path
        end
    end

    #Adds current user to orgnaisation
    def join
        organisation = Organisation.find(params[:id])
        User.update(current_user.id, organisation_id: organisation.id)
        redirect_to root_path
    end

    #Remove current user from orgnaisation
    def leave
        current_user.update(organisation_id: nil)
        redirect_to root_path
      end

    private

    def create_params
        params.require(:organisation).permit(:name, :hourly_rate)
    end
        
    def update_params
        params.require(:organisation).permit(:id, :name, :hourly_rate)
     end

end
