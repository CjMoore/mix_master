require_relative "../rails_helper"

RSpec.describe PlaylistsController, type: :controller do
  describe "Get #indx" do
    it "assigns all playlists as @playlists and renders the index template" do
      playlist = create(:playlist)

      get(:index)
      expect(assigns(:playlists)).to eq([playlist])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested playlist as @playlist and renders the show template" do
      playlist = create(:playlist)

      get(:show, {:id => playlist.to_param})
      expect(assigns(:playlist)).to eq(playlist)
      expect(response).to render_template('show')
    end
  end

  describe "GET #new" do
    it "assigns new playlist to @playlist" do
      get :new
      expect(assigns(:playlist)).to be_a_new(Playlist)
    end
  end

  describe "GET #edit" do
    it "assigns reqested playlist to @playlist" do
      playlist = create(:playlist)
      get(:edit, {:id => playlist.to_param})
      expect(assigns(:playlist)).to eq(playlist)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new playlist" do
        expect { post :create, {:playlist => attributes_for(:playlist)}}.to change(Playlist, :count).by(1)
      end

      it "assigns a newly created playlist as @playlist" do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it "redirects to the created playlist" do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(response).to redirect_to(Playlist.last)
      end
    end
    context "with invalid params" do
      it "assigns a newly created but unsaved playlist as @playlist" do
        post :create, {:playlist => attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to be_a_new(Playlist)
      end

      it "re-renders the 'new' template" do
        post :create, {:playlist => attributes_for(:playlist, name: nil)}
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      end
      it "updates requested playlsit" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New Playlist")}
        playlist.reload
        expect(playlist.name).to eq("New Playlist")
      end

      it "assigns the requested playlist to @playlist" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New Playlist")}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to @playlist show page" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New Name")}
        expect(response).to redirect_to(playlist)
      end
    end

    context "with invalid params" do
      it "assigns the playlist to @playlist" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to #edit" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}
        expect(response).to render_template('edit')
      end
    end
end
