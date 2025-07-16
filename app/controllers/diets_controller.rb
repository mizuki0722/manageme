class DietsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]  
def index
  # 基本となるクエリ（N+1対策と並び順）
  diets_scope = Diet.includes(:user).order(created_at: :desc)

  if params[:search].present?
    search_word = "%#{params[:search]}%"
    
    # 【修正箇所】users.name, diets.name, diets.about の3つを検索対象にする
    @diets = diets_scope.references(:user).where(
      "users.name LIKE ? OR diets.name LIKE ? OR diets.about LIKE ?",
      search_word, search_word, search_word
    )
  else
    # 検索していない場合は、基本クエリの結果をそのまま使う
    @diets = diets_scope
  end
end


  

    def new
        @diet = Diet.new
      end
    
      def create
        diet = Diet.new(diet_params)
        diet.user_id = current_user.id
        if diet.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @diet = Diet.find(params[:id])
          @comments = @diet.comments
        @comment = Comment.new
      end

      def edit
        @diet = Diet.find(params[:id])
      end

      def update
        diet = Diet.find(params[:id])
        if diet.update(diet_params)
          redirect_to :action => "show", :id => diet.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        diet = Diet.find(params[:id])
        diet.destroy
        redirect_to action: :index
      end

      private
      def diet_params
        params.require(:diet).permit(:name, :about, :image)
      end
    end
