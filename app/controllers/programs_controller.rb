class ProgramsController < ApplicationController

  before_action :ensure_current_user_is_admin, :only => [:update, :destroy, :show, :edit, :new]

    def ensure_current_user_is_admin
      @program = current_user.id
      if @program != 4
        redirect_to root_url, :alert => "Not Authorized"
      end
    end

  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new
    @program.t4_threshold = params[:t4_threshold]
    @program.t4_name = params[:t4_name]
    @program.t3_threshold = params[:t3_threshold]
    @program.t3_name = params[:t3_name]
    @program.t2_threshold = params[:t2_threshold]
    @program.t2_name = params[:t2_name]
    @program.t1_threshold = params[:t1_threshold]
    @program.t1_name = params[:t1_name]
    @program.program_type = params[:program_type]
    @program.program_name = params[:program_name]


    if @program.save
      redirect_to "/programs", :notice => "Program created successfully."
    else
      render 'new'
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    @program.t4_threshold = params[:t4_threshold]
    @program.t4_name = params[:t4_name]
    @program.t3_threshold = params[:t3_threshold]
    @program.t3_name = params[:t3_name]
    @program.t2_threshold = params[:t2_threshold]
    @program.t2_name = params[:t2_name]
    @program.t1_threshold = params[:t1_threshold]
    @program.t1_name = params[:t1_name]
    @program.program_type = params[:program_type]
    @program.program_name = params[:program_name]

    if @program.save
      redirect_to "/programs", :notice => "Program updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @program = Program.find(params[:id])

    @program.destroy

    redirect_to "/programs", :notice => "Program deleted."
  end
end
