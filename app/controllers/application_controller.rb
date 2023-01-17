class ApplicationController < ActionController::Base
    def maney(w_date, w_time1, w_time2, w_company_id)
        time1 = w_time1.to_time
        time2 = w_time2.to_time
        date = w_date.to_date
        company_id = w_company_id.to_i
        work_t = (time2 - time1).floor / 60
        if  Salary.find_by(date: date)
            m = (work_t * Salary.find_by(date: date).maney / 60).floor
            return m
        elsif  Salary.find_by(week: date.wday)
            m = (work_t * Salary.find_by(week: date.wday).maney / 60).floor
            return m
        else
            sum_t = 0
            sum_m = 0
            Salary.all.each do |salary|
                if salary.time1 != nil
                    if time1 < salary.time1
                        if time2 < salary.time1
                            t1 = 0
                            t2 = 0
                        elsif salary.time1 <= time2 && time2 <= salary.time2
                            t1 = salary.time1 
                            t2 = time2 
                        elsif time2 > salary.time2 
                            t1 = salary.time1 
                            t2 = salary.time2 
                        end 
                    elsif salary.time1 <= time1 && time1 <= salary.time2 
                        if salary.time1 <= time2 && time2 <= salary.time2 
                            t1 = salary.time1 
                            t2 = salary.time2 
                        elsif time2 > salary.time2 
                            t1 = work.time1 
                            t2 = salary.time2 
                        end 
                    elsif work.time1 > salary.time2 
                        t1 = 0 
                        t2 = 0 
                    end 
                    up_t = (t2 - t1).floor / 60 
                    up_m = (up_t * salary.maney / 60).floor 
                    sum_t += up_t 
                    sum_m += up_m 
                end
            end
            keep_t = work_t - sum_t
            keep_m = (keep_t * Company.find(company_id).maney / 60).floor
            m = sum_m + keep_m
            return m
        end
    end
end
