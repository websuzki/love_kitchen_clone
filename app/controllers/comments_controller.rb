class CommentsController < ApplicationController

    def create
        @article = Article.find(params[:comment][:article_id])
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            respond to do |format|
                format.html { redirect_to @article }
                format.js
            end
        else
            :show
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:content, :article_id)
        end
end
