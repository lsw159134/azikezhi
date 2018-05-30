package com.zikezhi.shiro;

import java.util.concurrent.atomic.AtomicInteger;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;

/**
 * @author ponder
 * @version 1.0
 * @Date 2016年8月23日
 * @Description: 凭证匹配器
 * 
 * @ClassName RetryLimitHashedCredentialsMatcher.java
 * 
 */

public class RetryLimitHashedCredentialsMatcher extends
		HashedCredentialsMatcher {

	private int errorTimes;
	
	private Cache<String, AtomicInteger> passwordRetryCache;
	
	public RetryLimitHashedCredentialsMatcher(CacheManager cacheManager){
		passwordRetryCache = cacheManager.getCache("passwordRetryCache");
	}
	
	public int getErrorTimes() {
		return errorTimes;
	}

	public void setErrorTimes(int errorTimes) {
		this.errorTimes = errorTimes;
	}

	@Override
	public boolean doCredentialsMatch(AuthenticationToken token,
			AuthenticationInfo info) {
		String username = (String) token.getPrincipal();
		AtomicInteger retryCount = passwordRetryCache.get(username);
		if(retryCount == null){
			retryCount = new AtomicInteger(0);
			passwordRetryCache.put(username, retryCount);
		}
		//重复输错5次时，需要等十分钟
		int total = 0;
		if(errorTimes == 0){
			total = 5;
		}else{
			total = errorTimes;
		}
		if(retryCount.incrementAndGet() > total){
			throw new ExcessiveAttemptsException();
		}
		boolean matches = super.doCredentialsMatch(token, info);
		if(matches){
			passwordRetryCache.remove(username);
		}
		
		return matches;
	}

}
