require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  fixtures :users
  describe 'post create' do
    it "can't create a note if you're not logged in" do
      post :create, note: {content: 'hush', visible_to: ''}
      assert_redirected_to '/'
    end
    it "can create a note if you're logged in" do
      alice = users(:alice)
      content = 'secret message'
      session[:user_id] = alice.id
      post :create, note: {content: content, visible_to: ''}
      assert_redirected_to '/'
      note = Note.last
      assert note.content == content
      assert note.readers == [alice]
      assert note.user = alice
    end
  end
end
