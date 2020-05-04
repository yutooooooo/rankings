module RankingsHelper
  def ranking_items(ranking, num)
    item_vote = Vote.where(item_id: ranking.items.pluck(:id)).group(:item_id).order('count_item_id desc').limit(num).count('item_id')
    @item_ids = item_vote.keys
    @item_votes = item_vote.values
    @items = Item.find(@item_ids)
  end
  
  def comment?(vote)
    !!vote.comment
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
