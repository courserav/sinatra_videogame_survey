class UsersController < ApplicationController

    get "/signup" do
        if logged_in?
            redirect to "/surveys"
        else
            erb :"users/new"
        end
    end

    post "/signup" do
        @user = User.new(params)
        if @user.save
            session[:id] = @user.id
            redirect to "/surveys"
        else
            redirect to "/signup"
        end
    end

    get "/login" do
        if logged_in?
            redirect to "/surveys"
        else
            erb :"users/login"
        end
    end

    post "/login" do
        @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:id] = @user.id
                redirect to "/surveys"
            else
                erb :"users/login", locals: {message: "Login failed. Please try again."}
            end
    end

    get "/users/:slug" do
        @user = User.find_by_slug(params[:slug])
        erb :"users/show"
    end

    get "/logout" do
        if logged_in?
            session.clear
            redirect to "/login"
        else
            redirect to "/"
        end
    end

end
