class PagesController < ApplicationController

def home
    
    #ransack advanced searches
    @adsearch = Degree.ransack(params[:q])
    ransackresults = @adsearch.result
    
    
end

def about
end

def summerschool
end

def new
end

end 

