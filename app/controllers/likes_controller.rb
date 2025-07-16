class LikesController < ApplicationController
  # いいねを作成するアクション
  def create
    # createアクションは現在のままで問題ありません。
    # diet_id を元に、ログイン中のユーザーのいいねを作成します。
    current_user.likes.create(diet_id: params[:diet_id])
    
    # 元の画面に戻ります。
    redirect_back(fallback_location: root_path)
  end

  # いいねを削除するアクション
  def destroy
    # --- ここを修正しました ---
    # ログイン中のユーザーがした「いいね」の中から、
    # URL経由で渡ってきたID（params[:id]）を持つものを探し出します。
    like = current_user.likes.find(params[:id])
    
    # 見つけた「いいね」をデータベースから削除します。
    like.destroy
    
    # 元の画面に戻ります。
    redirect_back(fallback_location: root_path)
  end
end
