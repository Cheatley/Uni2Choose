class SearchesController < ApplicationController

=begin
  def keyword_search
    @search = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @search_degree = Degree.search(params[:search]).order('cname ASC')
    end
  end
=end
  
  def adsearch
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

  def ques
  
  end
  
  def results
  end
  
  def quiz
  end

  def destroy
    Search.destroy_all(users_id: current_user)
    redirect_to save_search_path
  end
  
=begin
  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @showsearches.destroy
    respond_to do |format|
      format.html { redirect_to user_url(current_user), notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
=end

end