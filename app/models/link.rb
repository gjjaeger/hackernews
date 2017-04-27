class Link < ActiveRecord::Base
  validates :url, :presence => true
  before_create :init
  has_many :comments, as: :commentable

  def vote_up
    self.votes += 1
  end

  def init
    self.votes=0
  end

  def self.sort
    all_links = Link.all
    vote_order = Link.order(votes: :desc)
    time_order = Link.order(created_at: :desc)
    array_with_sum = []
    array_without_sum = []
    all_links.each do |link|
      vote_score=vote_order.index(link)+1
      time_score =time_order.index(link)+1
      sum = vote_score + time_score
      array_with_sum.push([link, sum])
    end
    array_with_sum=array_with_sum.sort_by{|x,y|y}
    array_with_sum.each() do |arr|
      array_without_sum.push(arr[0])
    end
    return array_without_sum
  end
end
