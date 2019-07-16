class QuestionsController < ApplicationController
    before_action :is_admin?
    before_action :set_eventosbahai
    def new
        @event = @event
        @question = @event.questions.new
    end

    def index
        @questions = @event.questions
        @participants = @event.participants
    end

    def show
        @event = @event
        @question = Question.find(params[:id])
    end

    def create
        puts "question params"
        puts questions_params
        question = @event.questions.new(questions_params)
        puts question.inspect

        respond_to do |format|
            if question.save!
              format.html { redirect_to eventosbahai_question_url(@event, question), notice: 'Pergunta criada.' }
              format.json { render :show, status: :created, location: question }
            else
              format.html { render :new }
              format.json { render json: question.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    def set_eventosbahai
        @event = Eventosbahai.find(params[:eventosbahai_id])
    end

    def questions_params
        params.require(:question).permit(:question)
    end

end