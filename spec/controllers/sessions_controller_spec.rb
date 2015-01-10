# tests for sessions controller
describe SessionsController do
  describe 'new' do
    it 'renders template for new' do
      get :new
      expect(response).to render_template(:new)
    end
  end
  describe 'create' do
    it 'good user, sets flash' do
      user = Fabricate(:user)
      post :create, username: user.username, password: user.password
      expect(request.flash[:success]).to eq 'log in successful'
    end
    it 'good user, sets session user_id' do
      user = Fabricate(:user)
      post :create, username: user.username, password: user.password
      expect(session[:user_id]).to eq user.id
    end
    it 'good user, redirects to root' do
      user = Fabricate(:user)
      post :create, username: user.username, password: user.password
      expect(response).to redirect_to root_path
    end
    it 'bad user, sets flash' do
      post :create
      expect(request.flash[:warning]).to eq 'sign in failed'
    end
    it 'bad use, redirect to login' do
      post :create
      expect(response).to redirect_to new_session_path
    end
  end
  describe 'destroy' do
    it 'redirects to root' do
      get :destroy
      expect(response).to redirect_to root_path
    end
    it 'sets flash message' do
      get :destroy
      expect(request.flash[:success]).to eq 'sign out successful'
    end
    it 'removes user_id from session' do
      session[:user_id] = 1
      get :destroy
      expect(session[:user_id]).to eq nil
    end
  end
end

