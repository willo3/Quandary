class GamesController < ApplicationController
  def index
    if params[:room_code]
      @game = Game.find_by(room_code: params[:room_code])
      @player = Player.new(avatar_url: Player::AVATARS.sample)
      @player.game = @game
      @player.user = current_user
      if @player.save
        @game.player_count += 1
        @game.save
        GameChannel.broadcast_to(
          @game,
          render_to_string(partial: "players/player", locals: {player: @player})
        )
        redirect_to game_path(@game)
        # head :ok

      else
        render :index, status: :unprocessable_entity
      end
    else
      flash[:error] = "Game not found"
      render :index
    end
  end

  def show
    @game = Game.find(params[:id])
    @user = current_user
    @user.score = 0
    @user.save
    # @game_first = Game.first
    # @dilemmas = @game_first.dilemmas
    # @game_first.dilemmas.update_all(game_id: @game.id)
    # @game.dilemmas << @dilemmas
    # @dilemma = @game.dilemmas.first
  end

  def create
    # Next 2 lines are original room code generator
    # room_code = [('A'..'Z')].map(&:to_a).flatten
    # room_code_string = (0...4).map { room_code[rand(room_code.length)] }.join

    # Profanity check
    profane_words =   [
      "ARSE", "BALS", "BALZ", "BALL", "BENT", "BERK", "BINT", "BONK", "CACK", "CHAV", "COCK", "CRAP", "FVCK", "CVNT",
      "CUNT", "DAMN", "DICK", "FECK", "GASH", "KNOB", "HELL", "HORE", "MUNT", "PISH", "PISS", "POOF", "POUF", "POXY",
      "PRAT", "PRIK", "PRIC", "PUSS", "RAPE", "SHAG", "SHIT", "SLAG", "SLUT", "TART", "TITS", "TOFF", "TOSS", "TUSS",
      "TWAT", "WANK", "WHOR", "FUCK", "SHIT", "ASSS", "AASS", "BITC", "CACA", "CACK", "COKS", "CUMS", "CUMZ", "CUNT",
      "DICK", "PUSS", "TWAT", "FAGG", "JIZZ", "SEXY", "NUDE", "HUMP", "BONA", "EREC", "ANUS", "KIKE", "KLIT", "MUFF",
      "NIGG", "PORN", "PRON", "TITT", "WEED", "ANAL", "BDSM", "BOOB", "BUTT", "CAWK", "CLIT", "CNUT", "COCK", "COON",
      "CRAP", "LICK", "DAGO", "DAMN", "SLAP", "SUCK", "DIKE", "DINK", "DONG", "HUMP", "DUMB", "DYKE", "ECHI", "FAGS",
      "FCUK", "FIST", "FOAH", "FOOK", "FROT", "FUKS", "FUXA", "BANG", "GOOK", "GURO", "HOAR", "HOER", "HOMO", "HORE",
      "JACK", "BAIT", "JAPP", "JERK", "JISM", "JIZM", "JIZZ", "JUGS", "KAWK", "KIKE", "KINK", "KNOB", "KOCK", "KUMM",
      "KUMS", "KUNT", "KYKE", "LUST", "MICK", "MILF", "MING", "MOFO", "MUFF", "NAZI", "NIGG", "NOGG", "NUDE", "SACK",
      "GASM", "ORGY", "PAKI", "PANT", "PEDO", "PHUK", "PIMP", "PISS", "POLE", "POOF", "POON", "TANG", "POOP", "PORN",
      "PRIK", "PRIC", "PUBE", "PUSI", "QEEF", "QUIM", "RAPE", "RIMM", "SCAT", "SEKS", "SHAG", "SHIT", "SHIZ", "SLAG",
      "SLUT", "SMEG", "SMUT", "SPAC", "SPIC", "SPIK", "SUCK", "TARD", "TITS", "TITT", "TOSS", "TURD", "TUSH", "TWAT",
      "VAJJ", "VADJ", "WANG", "YAOI", "BANG", "BUMM", "BUTT", "HOOR", "CNVT", "BVTT", "SLVT", "PVSS", "KVMS", "KVMZ",
      "CVMS", "CVMZ", "LVST", "FAQQ", "FAKK", "BARE", "PQQP", "CQCK"
    ]
    room_code = ""
    loop do
      @room_code_string = [('A'..'Z')].map(&:to_a).flatten.sample(4).join
      break unless profane_words.include?(room_code)
    end

    game = Game.create(room_code: @room_code_string, user: current_user)
    if game.save
      player = Player.new(avatar_url: Player::AVATARS.sample)
      player.game = game
      player.user = current_user
      if player.save
        redirect_to game_path(game)
      else
        render :home
      end
    else
      flash[:error] = "Game not found"
      render :index
    end
  end
end
