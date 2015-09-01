package com.lj.app.core.common.audit;

public final class AuditCode {

	/**
	 * 系统配置部分
	 * 
	 */
	public static final class SysCfg {

		public static final String createRole = "1-AIUAP-20016";// 增加角色
		public static final String updateRole = "1-AIUAP-20017";// 修改角色
		public static final String deleteRole = "1-AIUAP-20018";// 删除角色
		public static final String queryRole = "1-AIUAP-20019";// 查询角色

		/** UapDictionaryNoteadd: 数据字典 增加 */
		public static final String UAP_DICTIONARY_NOTE_ADD = "1-AIUAP-20413";
		/** UapDictionaryNoteadd: 数据字典 修改 */
		public static final String UAP_DICTIONARY_NOTE_MODIFY = "1-AIUAP-20414";
		/** UapDictionaryNoteadd: 数据字典 删除 */
		public static final String UAP_DICTIONARY_NOTE_DEL = "1-AIUAP-20415";
		/** UapDictionaryNoteadd: 数据字典数据 增加 */
		public static final String UAP_DICTIONARY_ADD = "1-AIUAP-20416";
		/** UapDictionaryNoteadd: 数据字典数据 修改 */
		public static final String UAP_DICTIONARY_MODIFY = "1-AIUAP-20417";
		/** UapDictionaryNoteadd: 数据字典数据 删除 */
		public static final String UAP_DICTIONARY_DEL = "1-AIUAP-20418";

		/** UAP_PERMISSION_ADD: 权限菜单 增加 */
		public static final String UAP_PERMISSION_ADD = "1-AIUAP-20419";
		/** UAP_PERMISSION_MODIFY: 权限菜单 修改 */
		public static final String UAP_PERMISSION_MODIFY = "1-AIUAP-20420";
		/** UAP_PERMISSION_DEL: 权限菜单 删除 */
		public static final String UAP_PERMISSION_DEL = "1-AIUAP-20421";
		/** UAP_PERMISSION_CANCEL: 权限菜单 停用 */
		public static final String UAP_PERMISSION_CANCEL = "1-AIUAP-20422";
		/** UAP_PERMISSION_STAR: 权限菜单 启用 */
		public static final String UAP_PERMISSION_STAR = "1-AIUAP-20423";
		//弱密码新增
		public static final String UAP_WEAK_PWD_ADD = "1-AIUAP-20424";
		//弱密码删除
		public static final String UAP_WEAK_PWD_DEL = "1-AIUAP-20425";
		//弱密码批量增加
		public static final String UAP_WEAK_PWD_BATCHADD = "1-AIUAP-20426";
		//应急系统禁止登陆组织配置操作
		public static final String UAP_EMERGENCY_ORG_CFG = "1-AIUAP-20427";
		/** 权限互斥菜单保存	 */
	}
		

	public static final String tokenCreate = "1-AIUAP-20595"; // 认证枢纽token申请
	public static final String tokenCheck = "1-AIUAP-20596"; // 认证枢纽token验证

}