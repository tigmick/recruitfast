class WelcomeController < ApplicationController
	include WelcomeHelper
  def index
  end
  def search
    # @search = PgSearch.multisearch(params[:search])
    if params[:search].present? || params[:category].present?
    @search = Job.where("title LIKE ?", "%#{params[:search]}%") unless params[:category].present?
    @search = Job.where("title LIKE ? AND industry_id = ?", "%#{params[:search]}%","#{params[:category]}") if params[:category].present?
    @search = Job.where("industry_id = ?","#{params[:category]}") unless params[:search].present?
    @search = @search.paginate(:page => params[:page], :per_page => 6).order(created_at: :desc)
    else
    	@search = Job.all.paginate(:page => params[:page], :per_page => 6).order(created_at: :desc)
    end
  end

  def search_candidate
   # user_ids =  UserJob.all.select{|j| (j.job_ids & current_user.jobs.map(&:id)).any?}.map(&:user_id).uniq
   # @users =  User.where("first_name LIKE ? AND role = ?","#{params[:search_candidate]}%", "candidate")
    if params[:salary_aearch].present?
      if params[:salary_aearch] < "60000"
        a = "0"   
        obj = params[:salary_aearch].to_s
      else
        a = "60000"
        obj = User.maximum(:salary_expectation)
      end
    else
      a = "0"
      obj = User.maximum(:salary_expectation)
    end
   
    @users =  User.where("lower(first_name) LIKE ? AND role = ? AND lower(current_location) LIKE ? AND lower(salary_expectation) BETWEEN ? AND ?","%#{params[:search_candidate].downcase}%", "candidate", "%#{params[:location_search].downcase}%", a, obj)
  end
end


# "salary_expectation BETWEEN ? AND ?", 0.to_s, 30000.to_s