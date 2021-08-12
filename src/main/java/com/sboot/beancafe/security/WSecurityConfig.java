package com.sboot.beancafe.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.sboot.beancafe.service.SecurityService;
import com.thoughtworks.xstream.mapper.DefaultMapper;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WSecurityConfig extends WebSecurityConfigurerAdapter{

	 private PrincipalDetailService principalDetailService;
	 
	 @Autowired
	 public WSecurityConfig(PrincipalDetailService principalDetailService) {
		 this.principalDetailService = principalDetailService;
	 }


	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		  auth.userDetailsService(principalDetailService).passwordEncoder(encodePWD());
	}
	
	protected void configure(HttpSecurity http) throws Exception{
			
			
			
			http.csrf().disable();	
			http.authorizeRequests()
					//.antMatchers("/**","/WEB-INF/views/**").permitAll()
					//.anyRequest().authenticated()
					.antMatchers("/test").hasRole("USER")//.authenticated()
					.anyRequest().permitAll()
				.and()
					.formLogin()
					.loginPage("/login")	
					.defaultSuccessUrl("/main",true)//.defaultSuccessUrl("/").
					.loginProcessingUrl("/logina")
					.usernameParameter("user_id")
					.passwordParameter("user_pw")
					.successHandler(new onAuthenticationSuccess())
					//.failureHandler(new onAuthenticationFailiure())
					.permitAll();
					//.and()
				//.exceptionHandling();
			http.logout()
			    .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
			    .logoutSuccessUrl("/login")
			    .invalidateHttpSession(true);
	}
	
	
	@Bean
    public PasswordEncoder encodePWD(){
        return new BCryptPasswordEncoder();
    }
}
