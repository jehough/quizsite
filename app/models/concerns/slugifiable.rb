module Slugifiable

  module InstanceMethods

    def slug
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      full_name = nil
      self.all.each do |obj|
        if obj.slug == slug
          full_name = obj
        end
      end
      full_name
    end

  end

end
