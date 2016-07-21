class RecquizController < ApplicationController

def computer
   @select = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @select_degree = Degree.search(params[:search])
    end
end

def design
   @select = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @select_degree = Degree.search(params[:search])
    end
end

def human
   @select = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @select_degree = Degree.search(params[:search])
    end
end

def lang
   @select = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @select_degree = Degree.search(params[:search])
    end
end

def law
   @select = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @select_degree = Degree.search(params[:search])
    end
end

def sci
   @select = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @select_degree = Degree.search(params[:search])
    end
end

def medicine
   @select = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @select_degree = Degree.search(params[:search])
    end
end

def course
   
  end
  

  def ques
  
  end
  
  def scivscomputer
  end
  
  def scivsmedicine
  end
  
  def scivslang
  end
  
  def sci
  end
  
  def lawvshumna
  end
  
  def lawvscomputer
  end
  
  def lawvsmedicine
  end
  
  def lawvslang
  end
  
  def law
  end
  
  def humanvscomputer
  end
  
  def humanvsmedicine
  end

  def humanvslang
  end

  def computervsmedicine
  end
  
  def computervslang
  end

  def designicinevslang
  end
  
  
  def designvsmedicine
  end
  
  def med 
  end
  
  def scivshuman
  end
  
  def designvscomputer
  end
  
  
  def designvslang
  end
  
  def designvshuman
  end
  
  def scivslaw
  end
  
  
  def designvslaw
  end
  


end