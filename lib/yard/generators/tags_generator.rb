module YARD
  module Generators
    class TagsGenerator < Base
      def sections_for(object)
        if format == :html
          [:header, [:param, :yieldparam, :return, :raise, :author, :version, :since, :see]]
        else
          [:header, :params, :returns] #[:raises, :yields, :yieldparams]
        end
      end
      
      def param(object)
        render_tags :param
      end
      
      def yieldparam(object)
        render_tags :yieldparam
      end
      
      def return(object)
        render_tags :return
      end
      
      def raise(object)
        render_tags :raise, :no_types => true
      end
      
      def author(object)
        render_tags :author, :no_types => true, :no_names => true
      end

      def version(object)
        render_tags :version, :no_types => true, :no_names => true
      end

      def since(object)
        render_tags :since, :no_types => true, :no_names => true
      end
      
      protected
      
      def render_tags(name, opts = {})
        opts = { :name => name }.update(opts)
        render(current_object, 'tags', opts)
      end
      
      def format_tag_types(typelist)
        return "" if typelist.nil?
        typelist = typelist.map {|t| t[0, 1] == '#' ? t : linkify(t) }
        typelist.empty? ? "" : "[" + typelist.join(", ") + "]"
      end
    end
  end
end