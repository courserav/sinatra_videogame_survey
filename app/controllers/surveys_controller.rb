class SurveysController < ApplicationController

    get "/surveys" do
        @surveys = Survey.all
        if logged_in?
            @user = current_user
            erb :"surveys/index"
        else
            redirect to "/login"
        end
    end

    get "/surveys/new" do
        if logged_in?
            erb :"surveys/new"
        else
            redirect to "/login"
        end
    end

    post "/surveys/new" do
        @user = current_user
        @survey = Survey.create(console: params[:console], genre: params[:genre], user: @user)
        if @survey.save
            redirect to "/users/#{@user.slug}"
        else
            redirect to "/surveys/new"
        end
    end

    get "/surveys/:id" do
        if logged_in?
            @survey = Survey.find_by(id: params[:id])
            erb :"surveys/show"
        else
            redirect to "/login"
        end
    end

    get "/surveys/:id/edit" do
        @survey = Survey.find_by(id: params[:id])
        is_authorized?(@survey, "/surveys")
        if logged_in? && @survey.user == current_user
            erb :"surveys/edit"
        else
            redirect to "/login"
        end
    end

    patch "/surveys/:id/edit" do
        @survey = Survey.find_by(id: params[:id])
        is_authorized?(@survey, "/surveys")
        if @survey.update(console: params[:console], genre: params[:genre])
            redirect to "/surveys/#{@survey.id}"
        else
            redirect to "/surveys/#{@survey.id}/edit"
        end
    end

    delete "/surveys/:id/delete" do
        @survey = Survey.find_by(:id => params[:id])
        is_authorized?(@survey, "/surveys")
        if logged_in? && @survey.user == current_user
            @survey.destroy
            redirect "/surveys"
        else
            redirect "/surveys/#{@survey.id}"
        end
    end
end
