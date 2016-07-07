class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  #ransack advanced searches
  def adsearch
    @adsearch = Degree.ransack(params[:q])
    ransackresults = @adsearch.result
    @adsearch.build_condition if @adsearch.conditions.empty?
    @adsearch.build_sort if @adsearch.sorts.empty?
    
    
    @northern = ["The University of Aberdeen", "University of the Highlands and Islands", "The Open University"]
    @southern = ["SRUC - Scotlands Rural College", "University of the West of Scotland", "The Open University"]
    @central = ["Abertay University", "City of Glasgow College", "University of Dundee", "The University of Edinburgh", 
      "Edinburgh Napier University", "University of Glasgow", "Glasgow Caledonian University", "The Glasgow School of Art", 
      "Heriot-Watt University, Edinburgh", "Middlesex University", "Queen Margaret University, Edinburgh", "Robert Gordon University", 
      "Royal Conservatoire of Scotland", "SAE Institute", "University of St Andrews", "The University of Stirling", 
      "The University of Strathclyde", "The Open University"]
    
    if params[:uregion]
      @choice = params[:uregion]
      if @choice == "Northern"
        uregion = Degree.all.where(uname: @northern)
      elsif @choice == "Central belt"
        uregion = Degree.all.where(uname: @central)
      elsif @choice == "South from Dundee"
        uregion = Degree.all.where(highers: @southern)
      end
    end
    
    if params[:uregion] != nil
      @data = uregion.merge(ransackresults)
    else
      @data = ransackresults
    end
    
  end

  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all
    @degreecourses = Degree.all
  end

=begin
   def f
    @types = Reccomend.select(:topic).distinct

  end
=end

  # GET /searches/1
  # GET /searches/1.json
  def show

  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  def keyword_search
    @search = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @search_degree = Degree.search(params[:search]).order('cname ASC')
    end
  end
  
  def course
    @select = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @select_degree = Degree.search(params[:search])
    end
  end
 

  def advanced_search
  end

  def quiz
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully deleted.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:select_course1, :select_course2, :select_course3, :select_course4, :select_course5)
    end
end