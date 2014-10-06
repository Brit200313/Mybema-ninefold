# == Schema Information
#
# Table name: discussion_comments
#
#  id            :integer          not null, primary key
#  body          :text
#  hidden        :boolean          default(FALSE)
#  discussion_id :integer
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  admin_id      :integer
#  guest_id      :string(255)
#

class DiscussionComment < ActiveRecord::Base
  belongs_to :discussion, counter_cache: true, touch: true
  belongs_to :user
  belongs_to :admin

  validates :body, presence: true

  scope :visible, -> { where(hidden: false) }

  def username
    if admin_id?
      admin.username
    elsif user_id?
      user.username
    else
      'Guest'
    end
  end
end
