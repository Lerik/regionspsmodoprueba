class ResourcesController < ApplicationController
	def categories
		@current_page = "RECURSOS"
		@categories = Category.all
	end

	def index
		@current_page = "RECURSOS"

		@tags = Array.new
		@category = params[:id]
		tmp = TagCategorization.find_by_category_id(params[:id])
		@tags = tmp.tags.order('id desc') unless tmp.nil?
		@path_recursos = "Recursos/#{Category.find(params[:id]).name}"
	end

	def bytag
		@current_page = "RECURSOS"
		tag = Tag.find(params[:t_id])
		@category = params[:c_id]


		@resources = tag.resources.order('position desc') unless tag.nil?
		@tag = tag.title unless tag.nil?

		@ret = "Recursos/#{Category.find(params[:c_id]).name}"
	end
end
