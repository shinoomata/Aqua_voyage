class AquariumFilterService
    def initialize(params)
      @params = params
    end
  
    def filter
      query = Aquarium.left_joins(:reviews).ransack(@params[:q])
  
      if @params[:q].present? && @params[:q][:reviews_content_cont].present?
        query.result(distinct: true).where('reviews.content LIKE ?', "%#{@params[:q][:reviews_content_cont]}%")
      elsif @params[:tag].present?
        Aquarium.tagged_with(@params[:tag])
      elsif @params[:tagged_with].present?
        Aquarium.tagged_with(@params[:tagged_with])
      else
        query.result(distinct: true)
      end
    end
  end