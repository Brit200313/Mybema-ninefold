class AppSettings < ActiveRecord::Base
  mount_uploader :all_articles_img, AllArticlesImageUploader
  mount_uploader :all_discussions_img, AllDiscussionsImageUploader
  mount_uploader :join_community_img, JoinCommunityImageUploader
  mount_uploader :new_discussion_img, NewDiscussionImageUploader
  mount_uploader :logo, LogoUploader

  validates_presence_of :hero_message

  def all_articles_image
    if all_articles_img.present?
      all_articles_img.url
    else
      all_articles_img.default_url
    end
  end

  def all_discussions_image
    if all_discussions_img.present?
      all_discussions_img.url
    else
      all_discussions_img.default_url
    end
  end

  def join_community_image
    if join_community_img.present?
      join_community_img.url
    else
      join_community_img.default_url
    end
  end

  def new_discussion_image
    if new_discussion_img.present?
      new_discussion_img.url
    else
      new_discussion_img.default_url
    end
  end

  def logo_image
    if logo.present?
      logo_img.url
    else
      logo.default_url
    end
  end
end