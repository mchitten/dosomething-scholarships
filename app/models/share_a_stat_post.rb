class ShareAStatPost < ActiveRecord::Base
  belongs_to :share_a_stat
end


class ShareAStatPostsController
  def create
    @share_a_stat = ShareAStatPost.new(share_a_stat_params)
    respond_to do |format|
      if @share_a_stat.save
        format.html { redirect_to @share_a_stat, notice: 'Share a stat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @share_a_stat }
      else
        format.html { render action: 'new' }
        format.json { render json: @share_a_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def share_a_stat_post_params
      params.require(:share_a_stat_post).permit(:share_a_stat_id, :my_name, :my_number, :friend_1, :friend_2, :friend_3, :friend_4, :friend_5, :friend_6)
    end
end