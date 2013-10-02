class ShareAStatsController < ApplicationController
  before_action :set_share_a_stat, only: [:show, :edit, :update, :destroy]
  gated_pages [:new, :edit, :create, :update, :delete, :posts], require: [:administrator, :staff], type: :any

  # GET /share_a_stats
  # GET /share_a_stats.json
  def index
    @share_a_stats = ShareAStat.where(published: true)
  end

  # GET /share_a_stats/1
  # GET /share_a_stats/1.json
  def show
    @post = ShareAStatPost.new
    expires_in 1.month, public: true, 'max-style' => true
  end

  def posts
    @share_a_stat = ShareAStat.find(params[:id])
    @posts = @share_a_stat.share_a_stat_posts.order('created_at DESC')
    # render json: @posts
  end

  # GET /share_a_stats/new
  def new
    @share_a_stat = ShareAStat.new
  end

  # GET /share_a_stats/1/edit
  def edit
  end

  # POST /share_a_stats
  # POST /share_a_stats.json
  def create
    @share_a_stat = ShareAStat.new(share_a_stat_params)

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

  # PATCH/PUT /share_a_stats/1
  # PATCH/PUT /share_a_stats/1.json
  def update
    respond_to do |format|
      if @share_a_stat.update(share_a_stat_params)
        format.html { redirect_to @share_a_stat, notice: 'Share a stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @share_a_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_a_stats/1
  # DELETE /share_a_stats/1.json
  def destroy
    @share_a_stat.destroy
    respond_to do |format|
      format.html { redirect_to share_a_stats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_a_stat
      @share_a_stat = ShareAStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_a_stat_params
      params.require(:share_a_stat).permit(:title, :message, :image, :tip, :mc_alpha, :mc_beta, :redirect, :redirect_message, :color_scheme, :published, :rules)
    end
end
