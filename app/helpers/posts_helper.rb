module PostsHelper
  def categories
    Hash[Category.all.map { |c| [c.id, c.name] }]
  end
end
