class SearchesController < ApplicationController
  
  #breadcrumbs
  add_crumb "Home", '/'
 
  def adsearch
    #breadcrumbs
    add_crumb "Detailed Search", adsearch_path, links: false
    
    #Ransack search: keyword searches for degree title and university name
    @adsearch = Degree.ransack(params[:q])
    ransackresults = @adsearch.result

    #define uni region for advanced search 
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
    
    #define discipline for the ucas letters
    if params[:discipline]
      @discipline = params[:discipline]
      if @discipline == "Medicine and Dentistry"
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
    
    #merge all selected and entered values of the advanced serach to do a specific search
    if params[:uregion] != nil
      @data = uregion.merge(ransackresults).merge(discipline)
    end

    #the drop-downs refine by region and discipline will have if not selected otherwise by the user
    #the selected default values of Any and Anywhere, otherwise the selected value persists in the form when the page is reloaded
    if params[:discipline] = nil
      @discipline = "Any"
      @uregion = "Anywhere"
    end
  end

  #recommender system
  def ques
  end
  def results
  end

  #quiz functionality
  def quiz
  end
  
  #delete all my search results functionality
  def destroy
    Search.destroy_all(users_id: current_user)
    redirect_to user_path(current_user)
  end
  
  
  
  def keywordsearch
    @search = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @search_degree = Degree.search(params[:search]).order('uname ASC')
    end
  end
  
end