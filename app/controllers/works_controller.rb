class WorksController < ApplicationController
    def new
        @work = Work.new(company_id: params[:company_id])
    end
    def create
        @work = Work.new(
            date: params[:work][:date],
            time1: params[:work][:time1],
            time2: params[:work][:time2],
            company_id: params[:work][:company_id],
            salary: maney(params[:work][:date], params[:work][:time1], params[:work][:time2], params[:work][:company_id]))
        @work.company = Company.find(params[:work][:company_id])#関連付け
        @work.save
        redirect_to new_work_path(company_id: params[:work][:company_id])
    end
    def show
        if params[:sel_date]["date(2i)"].to_i < 10
            @works = Work.where("date LIKE ?", "#{params[:sel_date]["date(1i)"]}-0#{params[:sel_date]["date(2i)"]}%")
        else
            @works = Work.where("date LIKE ?", "#{params[:sel_date]["date(1i)"]}-#{params[:sel_date]["date(2i)"]}%")
        end
    end
    def destroy
        work = Work.find(params[:id])
        work.destroy
        redirect_to companies_path #root_path
    end
end
