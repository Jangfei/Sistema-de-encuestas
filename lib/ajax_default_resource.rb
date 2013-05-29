def add_default_resource_methods( )
  class_eval do
    helper_method :object_name, :suffix

    protected
    def suffix
      @name_suffix ||= object_name.pluralize
    end

    alias :scope :end_of_association_chain

    def collection
      @search = scope.search(params[:q])
      @collection = @search.result.paginate(:page => params[:page], :per_page => 20)
    end

    def object_name
      self.class.object_name
    end
    
    destroy do
      wants.js {
        render "shared/crud/destroy", :format =>:js
      }
      flash{
        flash[:notice]=I18n.t(:resource_controller)[:successfully_removed]
      }
      failure.wants.js {
        render "shared/crud/destroy_fail", :format =>:js
      }
      failure.flash{
        flash[:notice]=I18n.t('resource_controller.failure_destroy', :message => object.errors[:base].to_s)
      }
    end
    
    update do
      wants.html {
        redirect_to collection_url
      }
      wants.js {
        if !request.xhr?
          redirect_to collection_url
        else
          render "shared/crud/update", :format =>:js
        end
      }
      flash{
        flash[:notice]=I18n.t(:resource_controller)[:successfully_updated]
      }
      failure.flash{
        flash[:notice]=I18n.t(:resource_controller)[:unsuccessfully_updated]
      }
      failure.wants.html {
        render :edit
      }
      failure.wants.js {
        if !request.xhr?
          render :edit
        else
          render "shared/crud/update_fail", :format =>:js
        end
      }
    end

    create do
      wants.html {
        redirect_to collection_url
      }
      wants.js {
        if !request.xhr?
          redirect_to collection_url
        else
          render "shared/crud/create", :format =>:js
        end
      }
      flash{
        flash[:notice]=I18n.t(:resource_controller)[:successfully_created]
      }
      failure.flash{
        flash[:notice]=I18n.t(:resource_controller)[:unsuccessfully_created]
      }
      failure.wants.html {
        render :new
      }
      failure.wants.js {
        render "shared/crud/create_fail", :format =>:js
      }
    end

    destroy.failure.flash do
      I18n.t('resource_controller.failure_destroy', :message => @object.errors[:base].to_s)
    end

    # Renderiza la respuesta para mostrar el formulario de edicion
    index.response do |wants|
      wants.html {
        render :action => params[:action], :layout => !request.xhr?
      }

    end

    edit.response do |wants|
      wants.html {
        render :action => params[:action], :layout => !request.xhr?
      }
    end

    # Renderiza la ventana de mostrar el objeto
    show.response do |wants|
      wants.html {
        render :action => params[:action], :layout => (!request.xhr? && !params[:xhr])
      }
    end

    #muestra el formulario para crear uno nuevo
    new_action.response do |wants|
      wants.html {
        render :action => params[:action], :layout => !request.xhr?
      }
    end
  end
end