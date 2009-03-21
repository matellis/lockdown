require File.join(File.dirname(__FILE__), "session")

Lockdown::System.configure do

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Configuration Options
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Options with defaults:
  #
  # Set timeout to 1 hour:
  #       options[:session_timeout] = (60 * 60)
  #
  # Set default_creator_id. This is the value assigned to created_by and/or
  # updated_by when no one is logged in.  Think of it as the system id.
  #
  #   Lockdown version < 0.9.0 set this to:
  #       options[:default_creator_id] = Profile::System
  #
  # Call method when timeout occurs (method must be callable by controller):
  #       options[:session_timeout_method] = :clear_session_values
  #
  # Set system to logout if unauthorized access is attempted:
  #       options[:logout_on_access_violation] = false
  #
  # Set redirect to path on unauthorized access attempt:
  #       options[:access_denied_path] = "/"
  #
  # Set redirect to path on successful login:
  #       options[:successful_login_path] = "/"
  #
  # Set separator on links call
  #       options[:links_separator] = "|"
  #
  # If deploying to a subdirectory, set that here. Defaults to nil
  #       options[:subdirectory] = "blog"
  #       *Notice: Do not add leading or trailing slashes,
  #                Lockdown will handle this
  #
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Define permissions
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  #
  # set_permission(:product_management).
  #   with_controller(:products)
  #
  # :product_management is the name of the permission which is later
  # referenced by the set_user_group method
  #
  # .with_controller(:products) defaults to all action_methods available on that
  #  controller.  You can change this behaviour by chaining on except_methods or
  #  only_methods.  (see examples below)
  #
  #  ** To define a namespaced controller use two underscores:
  #     :admin__products
  #
  # if products is your standard RESTful resource you'll get:
  #   ["products/index , "products/show",
  #    "products/new", "products/edit",
  #    "products/create", "products/update",
  #    "products/destroy"]
  #
  # You can chain method calls to restrict the methods for one controller
  # or you can add multiple controllers to one permission.
  #      
  #   set_permission(:security_management).
  #     with_controller(:users).
  #     and_controller(:user_groups).
  #     and_controller(:permissions) 
  #
  # In addition to with_controller(:controller) there are:
  #
  #   set_permission(:some_nice_permission_name).
  #     with_controller(:some_controller_name).
  #       only_methods(:only_method_1, :only_method_2)
  #
  #   set_permission(:some_nice_permission_name).
  #     with_controller(:some_controller_name).
  #       except_methods(:except_method_1, :except_method_2)
  #
  #   set_permission(:some_nice_permission_name).
  #     with_controller(:some_controller_name).
  #       except_methods(:except_method_1, :except_method_2).
  #     and_controller(:another_controller_name).
  #     and_controller(:yet_another_controller_name)
  #
  # Define your permissions here:

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Built-in user groups
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  #  You can assign the above permission to one of the built-in user groups
  #  by using the following:
  # 
  #  To allow public access on the permissions :sessions and :home:
  #    set_public_access :sessions, :home
  #     
  #  Restrict :my_account access to only authenticated users:
  #    set_protected_access :my_account
  #
  # Define the built-in user groups here:

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Define user groups
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  #
  #  set_user_group(:catalog_management, :category_management, 
  #                                      :product_management) 
  #
  #  :catalog_management is the name of the user group
  #  :category_management and :product_management refer to permission names
  #
  # 
  # Define your user groups here:

end 
