class UsersController < ApplicationController
  before_action :set_variables, only: [:edit, :new, :update, :create]
  before_action :ensure_login_user, only: [:edit, :update, :destroy]

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  # POST /users
  def create
    @user = User.new(user_params)
    flash[:success] = "Welcome to the Sample App!"
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  # PUT /users/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'User was successfully updated'
    else
      render 'edit'
    end
  end
  
  # DELETE /user/1
  def destroy
    @user = User.find(params[:id])

    # TODO write destroy
  end
  
  private
    # curreent_userとrequest idのuserが異なれば、redirectではじく
    def ensure_login_user
      user = User.find(params[:id])
      if user == current_user
        # do nothing
      else
        if logged_in?
          redirect_to current_user, notice: "You can't access the other's page"
        else
          redirect_to login_url, notice: "Please log in!" 
        end
      end
    end

    # strong parameters 
    def user_params
      params.require(:user).permit(:name, :email, :prefecture, :profile, :gender, :generation, :password, :password_confirmation)
    end
    
    # define common variables
    def set_variables
      @prefecture_hash = {
      "北海道" => "北海道",
    	"青森県" => "青森県",
    	"岩手県" => "岩手県",
    	"宮城県" => "宮城県",
    	"秋田県" => "秋田県",
    	"山形県" => "山形県",
    	"福島県" => "福島県",
    	"茨城県" => "茨城県",
    	"栃木県" => "栃木県",
    	"群馬県" => "群馬県",
    	"埼玉県" => "埼玉県",
    	"千葉県" => "千葉県",
    	"東京都" => "東京都",
    	"神奈川県" => "神奈川県",
    	"新潟県" => "新潟県",
    	"富山県" => "富山県",
    	"石川県" => "石川県",
    	"福井県" => "福井県",
    	"山梨県" => "山梨県",
    	"長野県" => "長野県",
    	"岐阜県" => "岐阜県",
    	"静岡県" => "静岡県",
    	"愛知県" => "愛知県",
    	"三重県" => "三重県",
    	"滋賀県" => "滋賀県",
    	"京都府" => "京都府",
    	"大阪府" => "大阪府",
    	"兵庫県" => "兵庫県",
    	"奈良県" => "奈良県",
    	"和歌山県" => "和歌山県",
    	"鳥取県" => "鳥取県",
    	"島根県" => "島根県",
    	"岡山県" => "岡山県",
    	"広島県" => "広島県",
    	"山口県" => "山口県",
    	"徳島県" => "徳島県",
    	"香川県" => "香川県",
    	"愛媛県" => "愛媛県",
    	"高知県" => "高知県",
    	"福岡県" => "福岡県",
    	"佐賀県" => "佐賀県",
    	"長崎県" => "長崎県",
    	"熊本県" => "熊本県",
    	"大分県" => "大分県",
    	"宮崎県" => "宮崎県",
    	"鹿児島県" => "鹿児島県",
    	"沖縄県" => "沖縄県"
      }

      @generation_hash = {
      "10代" => "10代",
    	"20代" => "20代",
    	"30代" => "30代",
    	"40代" => "40代",
    	"50代" => "50代",
    	"60代以降" => "60代以降",
      }
    end
    

end
