class Pin < ActiveRecord::Base
  	before_save :set_location
	acts_as_votable
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	before_save :geocode
  	geocoded_by :location, :if => :location_changed?


	 def set_location
	    self.location = "#{address} #{place}"
	 end

	 def self.search(search)
	   if search
	     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	   else
	     find(:all)
	   end
	 end

end
	