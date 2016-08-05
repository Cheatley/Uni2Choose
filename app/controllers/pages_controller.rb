class PagesController < ApplicationController
  
  #Homepage, with advanced search feature hidden as a simple keyword feature 
  #which leads to the complete advanced search to refine search results
  #Solely the search by keyword for degree title appears (part of Ransack)
  #See the Searches Controller for code explanation of the advanced search feature
  def home
    #Ransack
    @adsearch = Degree.ransack(params[:q])
    ransackresults = @adsearch.result

    @northern = ["The University of Aberdeen", "University of the Highlands and Islands", "The Open University"]
    @southern = ["SRUC - Scotlands Rural College", "University of the West of Scotland", "The Open University"]
    @central = ["Abertay University", "City of Glasgow College", "University of Dundee", "The University of Edinburgh",
      "Edinburgh Napier University", "University of Glasgow", "Glasgow Caledonian University", "The Glasgow School of Art",
      "Heriot-Watt University, Edinburgh", "Middlesex University", "Queen Margaret University, Edinburgh", "Robert Gordon University",
      "Royal Conservatoire of Scotland", "SAE Institute", "University of St Andrews", "The University of Stirling",
      "The University of Strathclyde", "The Open University"]
    if params[:uregion]
      @uregion = params[:uregion]
      if @uregion == "Anywhere"
        uregion = Degree.all
      elsif @uregion == "Northern"
        uregion = Degree.all.where(uname: @northern)
      elsif @uregion == "Central belt"
        uregion = Degree.all.where(uname: @central)
      elsif @uregion == "Southern"
        uregion = Degree.all.where(uname: @southern)
      end
    end

    if params[:discipline]
      @discipline = params[:discipline]
      if @discipline == "Any"
        discipline= Degree.all
      elsif @discipline == "Medicine and Dentistry"
        discipline = Degree.where('ucas ILIKE ?', "A%")
      elsif @discipline == "Subjects allied to Medicine"
        discipline = Degree.where('ucas ILIKE ?', "B%")
      elsif @discipline == "Biological Sciences"
        discipline = Degree.where('ucas ILIKE ?', "C%")
      elsif @discipline == "Veterinary Sciences, Agriculture and Related Subjects"
        discipline = Degree.where('ucas ILIKE ?', "D%")
      elsif @discipline == "Physical Sciences"
        discipline = Degree.where('ucas ILIKE ?', "F%")
      elsif @discipline == "Mathematical Sciences"
        discipline = Degree.where('ucas ILIKE ?', "G%")
      elsif @discipline == "Engineering"
        discipline = Degree.where('ucas ILIKE ?', "H%")
      elsif @discipline == "Computer Sciences"
        discipline = Degree.where('ucas ILIKE ?', "I%")
      elsif @discipline == "Technologies"
        discipline = Degree.where('ucas ILIKE ?', "J%")
      elsif @discipline == "Architecture, Building and Planning"
        discipline = Degree.where('ucas ILIKE ?', "K%")
      elsif @discipline == "Social Studies"
        discipline = Degree.where('ucas ILIKE ?', "L%")
      elsif @discipline == "Law"
        discipline = Degree.where('ucas ILIKE ?', "M%")
      elsif @discipline == "Business and Administrative Studies"
        discipline = Degree.where('ucas ILIKE ?', "N%")
      elsif @discipline == "Mass Communication and Documentation"
        discipline = Degree.where('ucas ILIKE ?', "P%")
      elsif @discipline == "Linguistics, Classics and Related Subjects"
        discipline = Degree.where('ucas ILIKE ?', "Q%")
      elsif @discipline == "European Languages, Literature and Related Subjects"
        discipline = Degree.where('ucas ILIKE ?', "R%")
      elsif @discipline == "Eastern, Asiatic, African, American and Australasian Languages, Literature and Related Subjects"
        discipline = Degree.where('ucas ILIKE ?', "T%")
      elsif @discipline == "Historical and Philosophical Studies"
        discipline = Degree.where('ucas ILIKE ?', "V%")
      elsif @discipline == "Creative Arts and Design"
        discipline = Degree.where('ucas ILIKE ?', "W%")
      elsif @discipline == "Education"
        discipline = Degree.where('ucas ILIKE ?', "X%")
      end
    end
    
    if params[:uregion] != nil
      @data = uregion.merge(ransackresults).merge(discipline)
    end
    
    if params[:discipline] = nil
      @discipline = "Any"
      @uregion = "Anywhere"
    end
  end

  #About page
  def about
    #breadcrumbs
    add_crumb "Home", '/'
    add_crumb "Prepare for University", about_path, links: false
  end

#privacy policy page
def privacy
   #breadcrumbs
    add_crumb "Home", '/'
    add_crumb "Privacy Policy", privacy_path, links: false
end 

 #course page used for testing
  def courses
    @degreecourses = Degree.all
  end

#uni page 
def unis
  @unis = University.all
end 

#aberdeen course page
def abdn
  @degreecourses = Degree.all
  @abdn = Degree.where(:uname => "The University of Aberdeen").all
end

#abertay course page
def abty
  @degreecourses = Degree.all
  @abty = Degree.where(:uname => "Abertay University").all
end

#city of glasgow college course page
def cogc
  @degreecourses = Degree.all
  @cogc = Degree.where(:uname => "City of Glasgow College").all
end

#dundee uni course page
def dund
  @degreecourses = Degree.all
  @dund = Degree.where(:uname => "University of Dundee").all
end

#Edinburgh Uni course page
def edin
  @degreecourses = Degree.all
  @edin = Degree.where(:uname => "The University of Edinburgh").all
end

#napier course page
def nap
  @degreecourses = Degree.all
  @nap = Degree.where(:uname => "Edinburgh Napier University").all
end

#glsgw course page
def glsgw
  @degreecourses = Degree.all
  @glsgw = Degree.where(:uname => "University of Glasgow").all
end

#glasgow cale course page
def cale
  @degreecourses = Degree.all
  @cale = Degree.where(:uname => "Glasgow Caledonian University").all
end

#glasgow school of art course page
def gsoa
  @degreecourses = Degree.all
  @gsoa = Degree.where(:uname => "The Glasgow School of Art").all
end

#heriot-watt uni course page
def hw
  @degreecourses = Degree.all
  @hw = Degree.where(:uname => "Heriot-Watt University, Edinburgh").all
end

#university of highlands and islands course page
def uhi
  @degreecourses = Degree.all
  @uhi = Degree.where(:uname => "University of the Highlands and Islands").all
end

#middlesex course page
def mdlsex
  @degreecourses = Degree.all
  @mdlsex = Degree.where(:uname => "Middlesex University").all
end

#open uni course page
def ou
  @degreecourses = Degree.all
  @ou = Degree.where(:uname => "The Open University").all
end

#queen margaret uni course page
def qmu
  @degreecourses = Degree.all
  @qmu = Degree.where(:uname => "Queen Margaret University, Edinburgh").all
end

#robert gordon course page
def rgu
  @degreecourses = Degree.all
  @rgu = Degree.where(:uname => "Robert Gordon University").all
end

#royal conservatoire of scotland course page
def rcos
  @degreecourses = Degree.all
  @rcos = Degree.where(:uname => "Royal Conservatoire of Scotland").all
end

#sae institute course page
def sae
  @degreecourses = Degree.all
  @sae = Degree.where(:uname => "SAE Institute").all
end

#SRUC course page
def srcu
  @degreecourses = Degree.all
  @srcu = Degree.where(:uname => "SRUC - Scotlands Rural College").all
end

#st andrews uni course page
def sta
  @degreecourses = Degree.all
  @sta = Degree.where(:uname => "University of St Andrews").all
end

#stirling course page
def strl
  @degreecourses = Degree.all
  @strl = Degree.where(:uname => "The University of Stirling").all
end

#strathclyde course page
def strath
  @degreecourses = Degree.all
  @strath = Degree.where(:uname => "The University of Strathclyde").all
end

#uws course page
def uws
  @degreecourses = Degree.all
  @uws = Degree.where(:uname => "University of the West of Scotland").all
end

end
