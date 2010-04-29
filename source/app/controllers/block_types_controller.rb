class BlockTypesController < ApplicationController
  #resource_controller
  
  before_filter :find_stage_types

  #create.wants.js { redirect_to block_types_path }


  
  def index
    @block_types = BlockType.find :all
  end

  def new
    @block_type = BlockType.new
  end

  def create
    @block_type = BlockType.new(params[:block_type])

   if @block_type.save
      printf("stage type 1 = %s", @block_type.stage_types[0].name)
     @block_type.stage_types.each do |stage_type|
       printf("block_type = %s, stage type = %s", @block_type.name, stage_type.name)
     end

      flash[:notice] = "Block type created!"
      redirect_to block_type_path(@block_type.id) # brzydko to wyglada?
    else
      render :action => :new
    end
  end

  def show
    @block_type = BlockType.find(params[:id])
  end

  def edit
    @block_type = BlockType.find(params[:id])
  end

  def update
    @block_type = BlockType.find(params[:id])
    @block_type.update_attributes(params[:block_type])
    redirect_to block_type_path(@block_type.id) # brzydko to wyglada?
  end

  def destroy
    BlockType.find(params[:id]).delete # a nie destroy
    flash[:notice] = 'Block type deleted'
    redirect_to block_types_path
  end





  private
  def find_stage_types
    @stage_types = StageType.find :all
  end

end
