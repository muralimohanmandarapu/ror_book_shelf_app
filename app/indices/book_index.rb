ThinkingSphinx::Index.define :book, :with => :active_record do
	indexes title, as => :title, :sortable => true
	indexes author, :as => :author, :sortable => true
	indexes description, :as => :description, :sortable => true
end
