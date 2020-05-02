module DiscussionHelper
  def render_poster(comment)
    render_user(comment.poster, comment.poster_id)
  end

  def render_last_poster(discussion)
    render_user(discussion.last_comment.poster, discussion.last_comment.poster_id)
  end

  def render_user(user, user_id)
    if user
      link_to(user.name, user_path(user))
    else
      "<i>(Deleted user #{user_id})</i>".html_safe
    end
  end

  def discussion_snippet(discussion)
    first_comment = discussion.comments.first
    format_user_text_as_plain(first_comment.text, first_comment.text_markup).truncate(200)
  end

  def scoped_discussion_path(discussion)
    if discussion.script
      script_discussion_path(discussion.script, discussion)
    else
      discussion_path(discussion)
    end
  end

  def scoped_comment_create_path(discussion)
    if discussion.script
      script_discussion_comments_path(discussion.script, discussion)
    else
      discussion_comments_path(discussion)
    end
  end
end