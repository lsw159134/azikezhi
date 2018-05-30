package com.zikezhi.shiro;

import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.UserInfoService;

/**
 * @author ponder
 * @version 1.0
 * @Date 2016年8月23日
 * @Description: Authenticator会把login传入的参数token交给UserRealm进行验证
 * 
 * @ClassName UserRealm.java
 * 
 */

public class UserRealm extends AuthorizingRealm {

	private UserInfoService userInfoService;

	/**
	 * 
	 * @param principals
	 * @Title UserRealm
	 * @Description: 授权方法，在配有缓存的情况下，只加载一次
	 * @return {@link org.apache.shiro.authz.AuthorizationInfo}
	 *
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("--授权--");
		String userName = principals.getPrimaryPrincipal().toString();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		Set<String> releName = userInfoService.findRoles(userName);
		Set<String> permissions = userInfoService.findPermissions(userName);
		info.setRoles(releName);
		info.setStringPermissions(permissions);

		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// 获取用户账号
		String userName = token.getPrincipal().toString();
		UserInfo userInfo = userInfoService.findUserByUsername(userName);
		if (userInfo != null) {
			// 将查询到的用户账号和密码存放到 authenticationInfo用于后面的权限判断。第三个参数随便放一个就行了
			AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo();
			return authenticationInfo;
		}else{
			return null;
		}
	}
}
