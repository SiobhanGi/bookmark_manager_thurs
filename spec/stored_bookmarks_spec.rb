require './lib/stored_bookmarks'

describe StoredBookmarks do

subject(:stored_bookmarks) { described_class }
# let(:new_bookmark) { double(:new_bookmark)}

  describe '.all' do
    it 'should return all saved bookmarks' do
      expect(stored_bookmarks.all).to be_an Array
    end
  end

  describe '.add' do
    it 'should add a bookmark to the stored bookmarks' do
      stored_bookmarks.add('http://www.bbc.co.uk/news')
      expect(stored_bookmarks.all).to include('http://www.bbc.co.uk/news')
    end
  end
end
