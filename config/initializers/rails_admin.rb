RailsAdmin.config do |config|

  #Title in Dashboard
  config.main_app_name = ['Papero', '']

  # #Sidebar links
  # config.navigation_static_links = {'nome do site' => 'http://enddosite'}
  # config.navigation_static_label = 'links uteis'

  config.model Unit do
    navigation_icon 'fas fa-hotel'
  end

  config.model User do
    navigation_icon 'fas fa-users'

    create do
      field  :name
      field  :email
      field  :phone_prefix
      field  :phone_number
      field  :gender
      field  :birth_date
      field  :cpf
      field  :street
      field  :number
      field  :complement
      field  :district
      field  :city
      field  :state
      field  :zip_code
      field  :responsible
      field  :sponsor
      field  :sponsor_cpf

      # field :admin_id, :hidden do
      #   default_value do
      #     bindings[:view]._current_admin
      #   end
      # end
      field :password, :hidden do
        default_value "123456"
      end
      # field :password_confirmation do
      #   default_value "123456"
      # end

      field :admin_id, :hidden do
        visible true
        default_value do
          bindings[:view].current_admin.id
        end
      end
    end
  end

  config.model Contract do
    navigation_icon 'fas fa-file-contract'
    parent User
  end

  config.model Invoice do
    navigation_icon 'fas fa-file-invoice-dollar'

    create do
      field  :pay_date
      field  :user
      field  :service_quantity
    end


  end

  # config.model ServiceQuantity do
  #   navigation_icon 'fas fa-users'

  #   create do
  #     field  :quantity
  #     field  :service_id

  #     field :invoice_id, :hidden do
  #       visible true
  #       default_value do
  #         bindings[:view].invoice.id
  #       end
  #     end
  #   end
  # end

  config.model Service do
    navigation_icon 'fas fa-concierge-bell'
  end

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end


end
