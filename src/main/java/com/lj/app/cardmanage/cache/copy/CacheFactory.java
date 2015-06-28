package com.lj.app.cardmanage.cache.copy;


public final class CacheFactory {
	
	public static final String APP_CACHE_NAME_KEY = "appCache";
	public static final String BANNER_CACHE_NAME_KEY = "bannerCache";
	public static final String THEMEURI_CACHE_NAME_KEY = "themeUriCache";
	public static final String SITE_CACHE_NAME_KEY = "siteCache";
	public static final String WIDGET_CACHE_NAME_KEY ="widgetCache";
		
	@SuppressWarnings("unchecked")
	public static <T> ICache<T> getCache(String name){
		ICache<T> ehCache = new EhCacheImpl(name);
		return ehCache;
	}
}
