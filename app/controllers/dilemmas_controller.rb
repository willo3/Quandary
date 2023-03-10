class DilemmasController < ApplicationController
  def show
    # ? if 1st dilemma , then load dilemma as Dilemma.find(params:dilemma_id)   /    else load dilemma as Dilemma.find(params:dilemma_id +1

    @dilemma = Dilemma.find(params[:id])
  end
end



# on results show page, clicking next, the next button links to current dilemma +1
