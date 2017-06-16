package com.lj.app.cardmanage.bulletin.model;


import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import com.lj.app.cardmanage.base.model.BaseModel;

public class Bulletin extends BaseModel{
	
	/**
	 * ID
	 */
	private Integer bulletinId;
	
	/**
	 * 类别名称
	 */
	private String typeName;
	
	/**
	 * 等级名称
	 */
	private String levelName;
	
	/**
	 * 标题
	 */
	private String title;
	
	/**
	 * 目标类别名称
	 */
	private String targetTypeName;
	
	/**
	 * 目标名称
	 */
	private String targetName;
	
	/**
	 * 是否内部名称
	 */
	private String isNestedName;
	
	/**
	 * 账号ID
	 */
	private Integer userId;
	
	/**
	 * 状态
	 */
	private String state;
	
	/**
	 * 生效日期
	 */
	private java.util.Date effDate;
	
	 /**
	 * 生效日期Begin
	 */
	private String  effDateBegin;
	/**
	 * 生效日期End
	 */
	private String effDateEnd;
	/**
	 * 有效期
	 */
	private java.util.Date expDate;
	
	 /**
	 * 有效期Begin
	 */
	private String  expDateBegin;
	/**
	 * 有效期End
	 */
	private String expDateEnd;
	/**
	 * 建创日期
	 */
	private java.util.Date createTime;
	
	 /**
	 * 建创日期Begin
	 */
	private String  createTimeBegin;
	/**
	 * 建创日期End
	 */
	private String createTimeEnd;
	/**
	 * 操作者
	 */
	private String operator;
	
	/**
	 * 操作日期
	 */
	private java.util.Date optDate;
	
	 /**
	 * 操作日期Begin
	 */
	private String  optDateBegin;
	/**
	 * 操作日期End
	 */
	private String optDateEnd;


	public void setBulletinId(Integer value) {
		this.bulletinId = value;
	}
	
	public Integer getBulletinId() {
		return this.bulletinId;
	}
	public void setTypeName(String value) {
		this.typeName = value;
	}
	
	public String getTypeName() {
		return this.typeName;
	}
	public void setLevelName(String value) {
		this.levelName = value;
	}
	
	public String getLevelName() {
		return this.levelName;
	}
	public void setTitle(String value) {
		this.title = value;
	}
	
	public String getTitle() {
		return this.title;
	}
	public void setTargetTypeName(String value) {
		this.targetTypeName = value;
	}
	
	public String getTargetTypeName() {
		return this.targetTypeName;
	}
	public void setTargetName(String value) {
		this.targetName = value;
	}
	
	public String getTargetName() {
		return this.targetName;
	}
	public void setIsNestedName(String value) {
		this.isNestedName = value;
	}
	
	public String getIsNestedName() {
		return this.isNestedName;
	}
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	public void setState(String value) {
		this.state = value;
	}
	
	public String getState() {
		return this.state;
	}
	public void setEffDate(java.util.Date value) {
		this.effDate = value;
	}
	
	public java.util.Date getEffDate() {
		return this.effDate;
	}
	public void setExpDate(java.util.Date value) {
		this.expDate = value;
	}
	
	public java.util.Date getExpDate() {
		return this.expDate;
	}
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	public void setOperator(String value) {
		this.operator = value;
	}
	
	public String getOperator() {
		return this.operator;
	}
	public void setOptDate(java.util.Date value) {
		this.optDate = value;
	}
	
	public java.util.Date getOptDate() {
		return this.optDate;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this)
			.append("BulletinId",getBulletinId())
			.append("TypeName",getTypeName())
			.append("LevelName",getLevelName())
			.append("Title",getTitle())
			.append("TargetTypeName",getTargetTypeName())
			.append("TargetName",getTargetName())
			.append("IsNestedName",getIsNestedName())
			.append("UserId",getUserId())
			.append("State",getState())
			.append("EffDate",getEffDate())
			.append("ExpDate",getExpDate())
			.append("CreateTime",getCreateTime())
			.append("Operator",getOperator())
			.append("OptDate",getOptDate())
			.toString();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getBulletinId())
			.append(getTypeName())
			.append(getLevelName())
			.append(getTitle())
			.append(getTargetTypeName())
			.append(getTargetName())
			.append(getIsNestedName())
			.append(getUserId())
			.append(getState())
			.append(getEffDate())
			.append(getExpDate())
			.append(getCreateTime())
			.append(getOperator())
			.append(getOptDate())
			.toHashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Bulletin == false) return false;
		if(this == obj) return true;
		Bulletin other = (Bulletin)obj;
		return new EqualsBuilder()
			.append(getBulletinId(),other.getBulletinId())
			.append(getTypeName(),other.getTypeName())
			.append(getLevelName(),other.getLevelName())
			.append(getTitle(),other.getTitle())
			.append(getTargetTypeName(),other.getTargetTypeName())
			.append(getTargetName(),other.getTargetName())
			.append(getIsNestedName(),other.getIsNestedName())
			.append(getUserId(),other.getUserId())
			.append(getState(),other.getState())
			.append(getEffDate(),other.getEffDate())
			.append(getExpDate(),other.getExpDate())
			.append(getCreateTime(),other.getCreateTime())
			.append(getOperator(),other.getOperator())
			.append(getOptDate(),other.getOptDate())
			.isEquals();
	}
}

