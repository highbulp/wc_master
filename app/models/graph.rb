require 'rubygems'
require 'active_model'

class Graph
	include ActiveModel::Validations

	# Begin subclass definitions
	class Node
		def initialize(id, name, url)
			@id = id
			@name = name
			@url = url
		end
	end	

	class Edge
		def initialize(id, a, b, rel_type)
			@relationship_id = id
			@cause_id = a
			@issue_id = b
			@rel_type = rel_type
		end
	end

	# End subclass definitions

	validates_presence_of :nodes, :edges

	# Initialization and Attributes
	attr_accessor :nodes, :edges

	def initialize(issues)
		# input issues should be
		@nodes = []
		@edges = []
		issues_to_graph = Issue.find(issues)
		update_graph_contents(issues_to_graph)
	end

	def initialize
		# Generates empty graph which can be filled later
		@nodes = []
		@edges = []
	end

	def update_graph_contents(issues)
		# Clear existing nodes, create issues for them
		@nodes = []
	
		# Clear existing edges, retrieve relationships for them
		@edges = []

	end

	# Custom graph generation
	def get_graph_of_path(src, dest, limit)
	end

	def get_graph_of_effects(issue, steps, limit)
	end

	def get_graph_where (condition, limit)
	end

	def get_graph_of_most_recent(limit=50)
		# Creates a graph of most recently updated issues (default limit 50)
		issues = Issue.order("updated_at DESC").limit(limit)
		update_graph_contents(issues)
	end
	
	def get_graph_of_most_connected (limit)	
		# Placeholder - functionality available in an unmerged branch...
	end

	def get_graph_of_all
		issues = Issue.find :all
		update_graph_contents(issues)
	end
end