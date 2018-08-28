require 'rails_helper'

RSpec.describe TweetsController, type: :feature do
  let(:current_user) { create(:user) }

  before do
    sign_in current_user
  end

  describe 'GET #index' do
    it 'should return resources paginated in chronological order' do
      all_tweets = create_list(:tweet, 50)
      tweets = all_tweets.reverse[0..20]
      visit tweets_path
      tweets.each do |tweet|
        expect(page).to have_content(tweet.message)
      end
      expect(page).to_not have_content(all_tweets[19].message)
    end
  end

  describe 'POST #create' do
    before do
      visit new_tweet_path
    end

    describe 'when is valid' do
      it 'should create a tweet' do
        fill_in 'tweet_message', with: 'Ruby on Rails'
        expect { click_button 'Create' }.to change(Tweet, :count).by(1)
        expect(Tweet.last.owner).to eq(current_user)
      end

      it 'should redirects to tweets_path' do
        fill_in 'tweet_message', with: 'Ruby on Rails'
        click_button 'Create'
        expect(current_path).to eq(tweets_path)
      end
    end

    describe 'when is invalid' do
      it 'should not create a tweet' do
        fill_in 'tweet_message', with: ''
        expect { click_button 'Create' }.to_not change(Tweet, :count)
      end

      it 'should display the new tweet form' do
        fill_in 'tweet_message', with: ''
        click_button 'Create'
        expect(page).to have_content('New Tweet')
      end
    end
  end

  describe 'PATCH #update' do
    let(:tweet) { create(:tweet) }
    before do
      visit edit_tweet_path(tweet)
    end

    describe 'when is valid' do
      it 'should update the tweet' do
        fill_in 'tweet_message', with: 'Message Edited'
        click_button 'Update'
        expect(tweet.reload.message).to eq('Message Edited')
      end

      it 'should redirects to tweets_path' do
        fill_in 'tweet_message', with: 'Message Edited'
        click_button 'Update'
        expect(current_path).to eq(tweets_path)
      end
    end

    describe 'when is invalid' do
      it 'should not update the tweet' do
        fill_in 'tweet_message', with: ''
        expect { click_button 'Update' }.to_not change(Tweet, :count)
        expect(tweet.message).to eq(tweet.reload.message)
      end

      it 'should display the new tweet form' do
        fill_in 'tweet_message', with: ''
        click_button 'Update'
        expect(page).to have_content('Edit Tweet')
      end
    end
  end

  xdescribe 'DELETE #destroy' do
    before do
      create(:tweet)
      visit tweets_path
    end

    it 'should delete the tweet' do
      expect { page.find('.glyphicon-remove').click }
        .to change(Tweet, :count).by(-1)
    end

    it 'should redirects to tweets_path' do
      page.find('.glyphicon-remove').click
      expect(current_path).to eq(tweets_path)
    end
  end
end
