class SiteController < ApplicationController

	def index
		@page = Page.find(1)
	end

	def cabling;end

	def dcs;end

	def eis;end

	def eus;end

	def ss;end

	def webservices;end

	def lv;end

	def ecommerce;end
end
