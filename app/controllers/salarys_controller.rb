class SalarysController < ApplicationController
    def new
        @salary = Salary.new(company_id: params[:company_id])
    end
    def create
        @salary = Salary.new(
            maney: params[:salary][:maney], 
            date: params[:salary][:date],
            week: params[:salary][:week],
            time1: params[:salary][:time1],
            time2: params[:salary][:time2],
            company_id: params[:salary][:company_id])
        @salary.company = Company.find(params[:salary][:company_id])
        @salary.save
        Work.all.each do |work|
            work.update(salary: maney(work.date, work.time1, work.time2, work.company_id))
        end
        redirect_to root_path
    end
    def destroy
        salary = Salary.find(params[:id])
        salary.destroy
        Work.all.each do |work|
            work.update(salary: maney(work.date, work.time1, work.time2, work.company_id))
        end
        redirect_to root_path
    end
end
