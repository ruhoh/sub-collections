module PageFilter

  # Page filter creates a filter relative to the directory the given page resides in.
  # It delegates to collection.filter but acts as 
  # a convenience interface to nested resources _relative_ to the given page.
  def filter
    @filter ||= Ruhoh::Views::Helpers::SimpleProxy.new({
      matcher: /^[\w\-\/]+$/,
      function: -> prefix {
        path = File.join(File.dirname(id), prefix)
        collection.filter.__send__(path)
      }
    })
  end
end

module PagesFilter
  def filter
    @filter ||= Ruhoh::Views::Helpers::SimpleProxy.new({
      matcher: /^[\w\-\/]+$/,
      function: -> prefix {
        dictionary.each_value.find_all { |model|
          model.id.start_with?(prefix) && File.basename(File.dirname(model.id)) != "drafts"
        }.sort
      }
    })
  end
end

Ruhoh::Resources::Pages::ModelView.send(:include, PageFilter)
Ruhoh::Resources::Pages::CollectionView.send(:include, PagesFilter)
