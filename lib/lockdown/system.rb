module Lockdown
  class System
    extend Lockdown::Rules

    def self.configure(&block)
      set_defaults 

      # Defined by the framework
      load_controller_classes

      # Lockdown::Rules defines the methods that are used inside block
      instance_eval(&block)

      # Lockdown::Rules defines parse_permissions
      parse_permissions

      Lockdown::Database.sync_with_db unless skip_sync?
    end

    def self.fetch(key)
      (@options||={})[key]
    end

    protected 

    def self.paths_for(str_sym, *methods)
      str_sym = str_sym.to_s if str_sym.is_a?(Symbol)
      if methods.empty?
        klass = fetch_controller_class(str_sym)
        methods = available_actions(klass) 
      end
      path_str = str_sym.gsub("__","\/") 
        
      subdir = Lockdown::System.fetch(:subdirectory)
      path_str = "#{subdir}/#{path_str}" if subdir

      controller_actions = methods.flatten.collect{|m| m.to_s}

      paths = controller_actions.collect{|meth| "#{path_str}/#{meth.to_s}" }

      if controller_actions.include?("index")
        paths += [path_str]
      end

      paths
    end

    def self.fetch_controller_class(str)
      controller_classes[Lockdown.controller_class_name(str)]
    end
  
 end # System class
end # Lockdown
