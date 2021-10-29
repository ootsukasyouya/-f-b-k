class PicturesController < ApplicationController

    before_action :set_picture, only: [:show, :edit, :update, :destroy]

    def confirm
        @picture = Picture.new(picture_params)
        render :new if @picture.invalid?
    end

    def new
        @picture = Picture.new
    end

    def index
        @pictures = Picture.all
    end

    def create
        @picture = Picture.new(picture_params)
        @picture.user_id = current_user.id
        if params[:back]
            render :new
        else
          if @picture.save
            redirect_to pictures_path notice: "投稿完了"
        else
            render :new
        end
      end
    end

    def show
        
    end

    def edit
        
    end

    def destroy
        @picture.destroy
        redirect_to pictures_path, notice:"削除しました！"
    end

    def update
        
        if @picture.update(picture_params)
          redirect_to pictures_path, notice: "編集完了！"
        else
          render :edit
        end
    end

    private
      def picture_params
        params.require(:picture).permit(:image, :content,  :image_cach)
      end

      def set_picture
        @picture = Picture.find(params[:id])
      end
end
