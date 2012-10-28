module PostsHelper
  def join_tags(post)
    post.tags.map { |t| t.name }.join(", ")
  end

  def humanize_date(date)
    date.strftime("%h %d %Y, %H:%M")
  end
end
