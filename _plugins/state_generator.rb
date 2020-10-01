module Jekyll
    class StatePageGenerator < Generator
      safe true
  
      def generate(site)
        if site.layouts.key? 'state'
          dir = 'states'
          Jekyll.configuration({})['states'].each_entry do |state|
            site.pages << StatePage.new(site, site.source, File.join(dir, state["url"]), state)
          end
        end
      end
    end
  

    class StatePage < Page
      def initialize(site, base, dir, state)
        @site = site
        @base = base
        @dir  = dir
        @name = 'index.html'
  
        self.process(@name)
        self.read_yaml(File.join(base, '_layouts'), 'state.html')
        self.data['state'] = state["name"]
      end
    end
  end