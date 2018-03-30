RailsAdmin.config do |config|

  config.current_user_method(&:current_user)
  config.authorize_with :cancan

  config.parent_controller = "ApplicationController"

  config.actions do
    dashboard
    index
    new do
      except ["Comment", "Order", "OrderDetail"]
    end
    export
    bulk_delete
    show
    edit do
      except ["Comment", "Order", "OrderDetail"]
    end
    delete
    show_in_app
  end

  config.model "AverageCache" do
    visible false
  end

  config.model "OverallAverage" do
    visible false
  end

  config.model "RatingCache" do
    visible false
  end

  config.model "MobileColor" do
    visible false
  end

  config.model "ShopMobile" do
    visible false
  end

  config.model "Image" do
    visible false
  end

  config.model "OrderDetail" do
    visible false
  end

  config.model Mobile do
    list do
      exclude_fields :review, :order_details, :comments, :mobile_colors, :images,
                     :shop_mobiles
    end

    create do
      include_all_fields
      include_fields :order_details, :comments, :shop_mobiles, :mobile_colors,
                     :rates_without_dimension, :raters_without_dimension,
                     :rate_average_without_dimension, :quality_rates, :quality_raters,
                     :quality_average  do
        visible false
      end
      field :review, :ck_editor
    end

    edit do
      include_all_fields
      include_fields :order_details, :comments, :shop_mobiles, :mobile_colors do
        visible false
      end
      field :review, :ck_editor
    end

    nested do
      field :images
    end
  end

  config.model Image do
    create do
      field :mobile_image
    end

    edit do
      field :mobile_image
    end
  end

  config.model Maker do
    create do
      field :name
    end
  end

  config.model Shop do
    create do
      exclude_fields :shop_mobiles
    end
  end

  config.model Advertisement do
    create do
      exclude_fields :number_of_clicks
    end

    edit do
      exclude_fields :number_of_clicks
    end
  end

end
