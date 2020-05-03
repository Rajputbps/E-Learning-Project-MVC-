package edu.homeEducation.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter; 




@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	
	@Autowired
	private DataSource dataSource;
	
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder builder) throws Exception {
		builder.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery("select email,passwod, enabled from Users where email=?").authoritiesByUsernameQuery("select email,passwod, enabled from Users where email=?");
	}
	
//	@Override
//	 protected void configure(HttpSecurity http) throws Exception {
//		 http.authorizeRequests().antMatchers("/login").access("hasRole('ROLE_USER')").anyRequest().permitAll().and().
//		 formLogin().loginPage("/E_Learning_FrontEnd").usernameParameter("username").passwordParameter("password").
//		 and().logout().logoutSuccessUrl("/login?logout").and().exceptionHandling().accessDeniedPage("/403").and().csrf();
//	 }
	
	
	 @Override
	  protected void configure(HttpSecurity http) throws Exception {
	    http.authorizeRequests().anyRequest().hasAnyRole("ADMIN", "USER")
	    .and()
	    .authorizeRequests().antMatchers("/").permitAll()
	    .and()
	    .formLogin().loginPage("/").loginProcessingUrl("/loginAction").permitAll()
	    .and()
	    .logout().logoutSuccessUrl("/login").permitAll()
	    .and()
	    .csrf();
	  }
	
}
