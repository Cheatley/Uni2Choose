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
  
  def help
  end
  
  def disclaimer
  end
  

end 

