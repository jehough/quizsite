module Slugifiable

  class InstanceMethods

    def slug
      self.username.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

  end

  class ClassMethods

    def self.find_by_slug(slug)
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
