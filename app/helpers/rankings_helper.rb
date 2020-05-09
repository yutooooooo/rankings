module RankingsHelper
  def ranking_items(ranking, n)
    item_vote = Vote.where(item_id: ranking.items.pluck(:id)).group(:item_id).order('count_item_id desc').count('item_id')
    ranking.items.each do |item|
      unless Vote.find_by(item_id: item.id)
        item_vote[item.id] = 0
      end
    end
    @item_ids = item_vote.keys[0..n]
    @item_votes = item_vote.values[0..n]
    @items = Item.find(@item_ids)
  end
  
  def comment?(vote)
    vote.comment.blank?
  end
  
  def comment_user(vote)
    @user = User.find(vote.user_id)
  end
  
  def vote?(ranking)
    @votes = Vote.where(item_id: ranking.items.pluck(:id))
    @user_ids = @votes.pluck(:user_id)
    @user_ids.include?(current_user.id)
  end
      
end
