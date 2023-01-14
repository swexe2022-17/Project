class CompaniesController < ApplicationController
    def index
        @companies = Company.all
    end
    def new
        @company = Company.new
    end
    def create
        @company = Company.new(name: params[:company][:name], 
        maney: params[:company][:maney])
        @company.save
        redirect_to root_path
    end
    def destroy
        company = Company.find(params[:id])
        company.destroy
        redirect_to root_path
    end
    def show
        @company = Company.find(params[:id])
    end
end
