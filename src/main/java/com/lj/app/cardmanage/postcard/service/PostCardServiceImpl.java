package com.lj.app.cardmanage.postcard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lj.app.cardmanage.base.service.BaseServiceImpl;
import com.lj.app.cardmanage.postcard.model.PostCard;

@Service("postCardService")
public class PostCardServiceImpl extends BaseServiceImpl implements PostCardService{

	/**
	 * 生成post机器卡片编号
	 * @return
	 */
	@Override
	public String generatePostCardNo(int userId,String userName){
		String postCardNo = "";
		String queryPostCardNo = "";
		
		PostCard queryPostCard = new PostCard();
		queryPostCard.setCreateBy(userId);
		queryPostCard.setUserName(userName);
		
		PostCard postCard = new PostCard();
		List<PostCard> postCardList = this.queryForList("getUserPostCardList", queryPostCard);
		
		if(postCardList!=null && postCardList.size()>0) {
			postCard = postCardList.get(0);
		}
		
		queryPostCardNo = postCard.getPostCardNo();
		
		if(queryPostCardNo==null || "".equals(queryPostCardNo)){
			postCardNo = userName + "_" + "001";
			return postCardNo;
		}
		
		String subStringUserNamePostCard  = queryPostCardNo.substring(userName.length()+1);
		
		if(subStringUserNamePostCard.startsWith("0")&&!subStringUserNamePostCard.startsWith("00")){
			String cardNoStr = subStringUserNamePostCard.substring(1);
			int cardNo = Integer.parseInt(cardNoStr) +1;
			if(cardNo>=100) {
				postCardNo = userName+"_"+cardNo;
			}else {
				postCardNo = userName+"_"+"0"+cardNo;
			}
			return postCardNo;
		}

		if(subStringUserNamePostCard.startsWith("00")){
			String cardNoStr = subStringUserNamePostCard.substring(2);
			int cardNo = Integer.parseInt(cardNoStr) +1;
			if(cardNo>=10) {
				postCardNo = userName+"_"+"0"+cardNo;
			}else {
				postCardNo = userName+"_"+"00"+cardNo;
			}
			return postCardNo;
		}
		
		return postCardNo;
	}
	
}
