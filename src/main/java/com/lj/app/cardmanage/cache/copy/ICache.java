package com.lj.app.cardmanage.cache.copy;

public interface ICache<T> {
	public T get(Object key);
	public void put(Object key, T value);
	public void remove(Object key);
	public void clear();
}

