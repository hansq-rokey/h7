package com.ibaixiong.merchant.realm;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cas.CasAuthenticationException;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.cas.CasToken;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.StringUtils;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.Assertion;
import org.jasig.cas.client.validation.TicketValidationException;
import org.jasig.cas.client.validation.TicketValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.User;
import com.ibaixiong.merchant.service.SsssCityMerchantService;
import com.ibaixiong.merchant.service.UserService;


public class MyCasRealm extends CasRealm{
	 @Autowired
	 private UserService userService;
	 @Autowired
	 private SsssCityMerchantService ssssCityMerchantService;
	 private static Logger log = LoggerFactory.getLogger(MyCasRealm.class);

		 @Override
		protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
			 CasToken casToken = (CasToken) token;
		        if (token == null) {
		            return null;
		        }
		        
		        String ticket = (String)casToken.getCredentials();
		        if (!StringUtils.hasText(ticket)) {
		            return null;
		        }
		        
		        TicketValidator ticketValidator = ensureTicketValidator();

		        try {
		            // contact CAS server to validate service ticket
		            Assertion casAssertion = ticketValidator.validate(ticket, getCasService());
		            // get principal, user id and attributes
		            AttributePrincipal casPrincipal = casAssertion.getPrincipal();
		            String userId = casPrincipal.getName();
		            log.debug("Validate ticket : {} in CAS server : {} to retrieve user : {}", new Object[]{
		                    ticket, getCasServerUrlPrefix(), userId
		            });
		            casToken.setUserId(userId);
		           Map<String, Object> map= casAssertion.getPrincipal().getAttributes();
		           
		           User user=new User();
		           user.setId(Long.valueOf(map.get("id").toString()));
		           user.setPhone(map.get("phone")==null?null:map.get("phone").toString());
		           user.setEmail(map.get("email")==null?null:map.get("email").toString());
		           user.setNickName(map.get("nickName")==null?null:map.get("nickName").toString());
		           user.setBxNum(map.get("bxNum")==null?null:map.get("bxNum").toString());
		           log.debug("id :"+map.get("id"));
		            
		            Map<String, Object> attributes = casPrincipal.getAttributes();
		            // refresh authentication token (user id + remember me)
		            casToken.setUserId(userId);
		            String rememberMeAttributeName = getRememberMeAttributeName();
		            String rememberMeStringValue = (String)attributes.get(rememberMeAttributeName);
		            boolean isRemembered = rememberMeStringValue != null && Boolean.parseBoolean(rememberMeStringValue);
		            if (isRemembered) {
		                casToken.setRememberMe(true);
		            }
		            // create simple authentication info
//		            List<Object> principals = CollectionUtils.asList(userId, attributes);
//		            PrincipalCollection principalCollection = new SimplePrincipalCollection(principals, getName());
		            return new SimpleAuthenticationInfo(user, ticket, getName());
//		            return new SimpleAuthenticationInfo(principalCollection, ticket);
		        } catch (TicketValidationException e) { 
		            throw new CasAuthenticationException("Unable to validate ticket [" + ticket + "]", e);
		        }
		}
		@Override
		protected AuthorizationInfo doGetAuthorizationInfo(
				PrincipalCollection principals) {
			SimplePrincipalCollection principalCollection = (SimplePrincipalCollection) principals;
			List<Object> listPrincipals = principalCollection.asList();
			User user=(User) listPrincipals.get(0);
//			Map<String, String> attributes = (Map<String, String>) listPrincipals.get(0);
//			String userId = attributes.get("id");

			SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
			List<String> rolesList = userService.queryRoles(Long.valueOf(user.getId()));
			List<String> permissionsList = userService.queryPermissions(Long.valueOf(user.getId()));
			//代理商特殊处理查询代理商信息，光有角色无法说明他是代理商
			SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
			if(ssssCityMerchant != null)
				authorizationInfo.setRoles(new HashSet<String>(rolesList));

			authorizationInfo.setStringPermissions(new HashSet<String>(permissionsList));
			log.info("用户角色：" + Arrays.toString(rolesList.toArray()));
			log.info("用户权限：" + Arrays.toString(permissionsList.toArray()));
			return authorizationInfo;
		}
}
