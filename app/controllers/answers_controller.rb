class AnswersController < ApplicationController
    skip_before_action :verify_authenticity_token
    acts_as_token_authentication_handler_for User
    before_action :authenticate_user!

    def create
        default_answers = ["sim", "nao", "talvez"]
        db_answers = ["sim": "yes", "nao": "no", "talvez": "maybe"]

        # Cancel if the answer is different than expected
        resp = params[:answer]
        if(!default_answers.include? (params[:answer] ))
            puts "Resposta errada"
            return nil
        end

        @event = Eventosbahai.find(params[:eventosbahai_id])
        @question = Question.find(params[:question_id])

        #Verify if user participates in this Event
        if current_user.participants.where(eventosbahai_id: @event.id).blank?
            puts "Usuário não participa deste evento"
            return nil
        end

        participant = current_user.participants.where(eventosbahai_id: @event.id).first

        answer = participant.answers.where(question_id: @question.id)
        if answer.blank?
            answer = participant.answers.new
            answer.question_id = @question.id
            answer.answer = params[:answer]
            answer.save!
        else
            answer.update(answer: params[:answer])
        end
        
        redirect_to eventosbahai_question_show_answer_path(@event.id, @question.id)
    end

    def show
        @event = Eventosbahai.find(params[:eventosbahai_id])
        @question = Question.find(params[:question_id])

    end

end
    