class PathNode
  attr_accessor :here, :previous, :m
end

class Node
  attr_accessor :name, :branches
end

class Mapping
  attr_accessor :nodes

  def initialize(from, to)
    @from = from
    @to = to
  end

  def shortest_path
    m = 0
    path_nodes = [PathNode.new(@to, '_', m)]
    while !reached_dest(path_nodes)
      m += 1
      path_nodes.each do |path_node|
        path_node.branches.each do |node|
          if node[0].name != path_node.previous && path_node.m + node[1] == m
            path_nodes << PathNode.new(node[0], path_node.name, m)
          end
        end
      end
    end
  end

  def reached_dest(path_nodes)
    path_nodes.each do |path_node|
      return true if path_node.here == @from
    end
    false
  end
end


