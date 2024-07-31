module Api
  module V1
    class PeopleController < ApplicationController
      before_action :set_person, only: %i[ show update destroy ]

      # GET /people
      def index
        @people = Person.all
        # @people = Person.select(:id, :first_name, :last_name, :gender, :given_last_name)
        # you can use above in place of line 8 then remove th .as_json upward from line 12

        render json: @people.as_json(only: [:id, :first_name, :last_name, :gender, :given_last_name])
      end

      # GET /people/1
      def show
        render json: @person.as_json(only: [:id, :first_name, :last_name, :gender, :given_last_name])
      end

      # POST /people
      def create
        @person = Person.new(person_params)

        if @person.save
          render json: @person, status: :created, location: @person
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /people/1
      def update
        if @person.update(person_params)
          render json: @person
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      # DELETE /people/1
      def destroy
        @person.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_person
          @person = Person.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def person_params
          params.require(:person).permit(:first_name, :last_name, :given_last_name, :gender)
        end
    end

  end
end
