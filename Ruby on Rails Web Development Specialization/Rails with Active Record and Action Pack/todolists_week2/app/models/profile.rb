class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_or_last_name_null_not_both
  validates :gender, inclusion: ['female', 'male']
  validate :no_boy_named_Sue

  def first_or_last_name_null_not_both
  	if first_name.nil? and last_name.nil?
		errors.add(:first_name, "first_name and last_name can not be both null")
  	end
  end

  def no_boy_named_Sue
  	if gender == "male" && first_name == "Sue"
  		errors.add(:first_name, "No male is allowed to have a first_name Sue")
  	end
  end

  scope :get_all_profiles, -> (min, max){
  	Profile.where("birth_year between :min_date and :max_date", min_date: min, max_date: max).order(:birth_year).to_a
  }
end
