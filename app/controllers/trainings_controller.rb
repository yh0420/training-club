class TrainingsController < ApplicationController
  before_action :set_training, only: %i[edit update destroy]

  def index
    p "training(index)"
    p session
    @trainings = current_user.trainings.order(id: :asc)
  end

  def new
    @training = Training.new
  end

  def create
    @training = current_user.trainings.build(training_params)
    if @training.save
      redirect_to trainings_path, notice: "登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def edit

  end

  def update
    if @training.update(training_params)
      redirect_to trainings_path, notice: '更新しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @training.destroy!
    redirect_to trainings_path, alert: '削除しました'
  end

  private

  def training_params
    params.require(:training).permit(:name)
  end

  def set_training
    @training = Training.find(params[:id])
  end
end
