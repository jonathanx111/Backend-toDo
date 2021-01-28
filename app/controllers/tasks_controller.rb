class TasksController < ApplicationController
    before_action :authenticate
    def show 
        task = Task.find(params[:id])
        render json: task
    end

    def edit_task
        tasks = @user.tasks
        task = tasks.find(params[:id])
        task.update(description: params[:description], points: params[:points], done: params[:done])
        render json: task
    end

    def create
        task = Task.create!(task_params)
        if task.valid? 
            render json: task
        else
            render json: {errors: task.errors.full_messages, status: :unprocessable_entity}
        end
    end

    def destroy 
        task = Task.find(params[:id])
        task.destroy
        render json: task
    end

    private 

    def task_params
        params.require(:task).permit(:user_id, :day_id, :description, :points, :done)
    end
end
