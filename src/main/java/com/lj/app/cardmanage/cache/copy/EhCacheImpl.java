package com.lj.app.cardmanage.cache.copy;

import java.io.Serializable;


import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
public class EhCacheImpl  implements ICache{

	private net.sf.ehcache.Cache cache;
	
	public EhCacheImpl(String name){
        try {
            CacheManager manager = CacheManager.getInstance();
            cache = manager.getCache(name);
            
            if (cache == null) {
                manager.addCache(name);
                cache = manager.getCache(name);
            }
        } catch (net.sf.ehcache.CacheException e) {
        	e.printStackTrace();
        }
	}

    public Object get(Object key){
    	
    	Object obj = null;
        try {
            if (key!= null) {
                Element element = cache.get((Serializable) key);
                if (element!=null) {
                    obj = element.getValue();
                }
            }
        } catch (net.sf.ehcache.CacheException e) {
            e.printStackTrace();
        }
        return obj;
    }


    public void put(Object key, Object value){
        try {
            Element element = new Element((Serializable) key, (Serializable) value);            
            cache.put(element);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
    }

    public void remove(Object key){
        try {
            cache.remove((Serializable) key);
        } catch (ClassCastException e) {
            e.printStackTrace();
        } catch (IllegalStateException e) {
        	e.printStackTrace();
        }
    }

    public void clear(){
        try {
            cache.removeAll();
        } catch (IllegalStateException e) {
        	e.printStackTrace();
        } 
    }

}

