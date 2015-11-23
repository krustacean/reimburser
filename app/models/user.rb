class User < ActiveRecord::Base
  has_many :transactions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers=>[:amazon]

  # after_create :send_welcome_mail
  # def send_welcome_mail
  #    @user = User.new(params[:user])

  #     respond_to do  |format|
  #       if @user.save
  #         #tell the usermailer to send a welcome email
  #         UserMailer.welcome_email(@user).deliver_later

  #         format.html { redirect_to(@user, notice: 'User was successfully created.')}
  #         format.json { render json: @user, status: created, location: @user}

  #       else format.html {render action: 'new'}
  #             format.json{render json: @user.errors, status: :unprocessable_entity }
  #           end
  #         end
  #       end
  # end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def confirm!
    welcome_email
    super
  end


 
  
end
