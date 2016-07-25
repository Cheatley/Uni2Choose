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
      elsif @uregion == "South from Dundee"
        uregion = Degree.all.where(uname: @southern)
      end
    end

    if params[:discipline]
      @discipline = params[:discipline]
      if @discipline == "Any"
        discipline= Degree.all
      elsif @discipline == "Medicine and Dentistry"
        discipline = Degree.where('ucas LIKE ?', "A%")
      elsif @discipline == "Subjects allied to Medicine"
        discipline = Degree.where('ucas LIKE ?', "B%")
      elsif @discipline == "Biological Sciences"
        discipline = Degree.where('ucas LIKE ?', "C%")
      elsif @discipline == "Veterinary Sciences, Agriculture and Related Subjects"
        discipline = Degree.where('ucas LIKE ?', "D%")
      elsif @discipline == "Physical Sciences"
        discipline = Degree.where('ucas LIKE ?', "F%")
      elsif @discipline == "Mathematical Sciences"
        discipline = Degree.where('ucas LIKE ?', "G%")
      elsif @discipline == "Engineering"
        discipline = Degree.where('ucas LIKE ?', "H%")
      elsif @discipline == "Computer Sciences"
        discipline = Degree.where('ucas LIKE ?', "I%")
      elsif @discipline == "Technologies"
        discipline = Degree.where('ucas LIKE ?', "J%")
      elsif @discipline == "Architecture, Building and Planning"
        discipline = Degree.where('ucas LIKE ?', "K%")
      elsif @discipline == "Social Studies"
        discipline = Degree.where('ucas LIKE ?', "L%")
      elsif @discipline == "Law"
        discipline = Degree.where('ucas LIKE ?', "M%")
      elsif @discipline == "Business and Administrative Studies"
        discipline = Degree.where('ucas LIKE ?', "N%")
      elsif @discipline == "Mass Communication and Documentation"
        discipline = Degree.where('ucas LIKE ?', "P%")
      elsif @discipline == "Linguistics, Classics and Related Subjects"
        discipline = Degree.where('ucas LIKE ?', "Q%")
      elsif @discipline == "European Languages, Literature and Related Subjects"
        discipline = Degree.where('ucas LIKE ?', "R%")
      elsif @discipline == "Eastern, Asiatic, African, American and Australasian Languages, Literature and Related Subjects"
        discipline = Degree.where('ucas LIKE ?', "T%")
      elsif @discipline == "Historical and Philosophical Studies"
        discipline = Degree.where('ucas LIKE ?', "V%")
      elsif @discipline == "Creative Arts and Design"
        discipline = Degree.where('ucas LIKE ?', "W%")
      elsif @discipline == "Education"
        discipline = Degree.where('ucas LIKE ?', "X%")
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

def about
end

def summerschool
  add_crumb "Home", '/'
  add_crumb "Prepare for University", summerschool_path, links: false
end

  #About page
  def about
    #breadcrumbs
    add_crumb "Home", '/'
    add_crumb "Prepare for University", about_path, links: false
  end
  
  #Recommender System
  def new
  end
  

end 

