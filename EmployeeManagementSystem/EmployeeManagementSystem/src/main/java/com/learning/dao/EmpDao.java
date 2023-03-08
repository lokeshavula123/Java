package com.learning.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.learning.beans.Emp;
import com.learning.beans.LoginUser;
import com.learning.beans.Users;


public class EmpDao {
	public String user,pass;
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Emp p) {
		String sql = "insert into emp(name,salary,designation) values('" + p.getName() + "'," + p.getSalary() + ",'"
				+ p.getDesignation() + "')";
		return template.update(sql);
	}
	public int insert(Users u) {
		String query="insert into userlogin(firstname , lastname , user_id,password1,status1) values('"+u.getFirst_name()+"','"+u.getLast_name()+"','"+u.getUser_id()+"','"+u.getPassword()+"',0)";
		return template.update(query);
	
	
}
	public int update(Emp p) {
		String sql = "update emp set name='" + p.getName() + "', salary=" + p.getSalary() + ",designation='"
				+ p.getDesignation() + "' where id=" + p.getId() + "";
		return template.update(sql);
	}

	public int delete(int id) {
		String sql = "delete from emp where id=" + id + "";
		return template.update(sql);
	}

	public Emp getEmpById(int id) {
		String sql = "select * from emp where id=?";
		return template.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<Emp>(Emp.class));
	}

	public List<Emp> getEmployees() {
		return template.query("select * from emp", new RowMapper<Emp>() {
			public Emp mapRow(ResultSet rs, int row) throws SQLException {
				Emp e = new Emp();
				e.setId(rs.getInt(1));
				e.setName(rs.getString(2));
				e.setSalary(rs.getFloat(3));
				e.setDesignation(rs.getString(4));
				return e;
			}
		});
	}
	public void setUserName(String userName) {
		user = userName;
		
	}
	public String getUserName() {
		return user;
		
	}
	
	public void setPassWord(String passWord) {
		pass = passWord;
	}
	public String getPassWord() {
		return pass;
		
	}
	
	public boolean log(LoginUser users) {
		user = users.getUser();
		pass = users.getPass();
		
		List<Integer> ids = new ArrayList<Integer>();
		String sql="Select id from userlogin where user_id='"+user+"' and password1 = '"+pass+"'";
		ids = template.query(sql,new RowMapper<Integer>() {
			public Integer mapRow(ResultSet rs, int row) throws SQLException {
				
				return rs.getInt(1);
				
			}
		}); 
		
		if(ids.size()!=1) {
			
			
			return false;
		}
		int a = ids.get(0);
		template.update("update userlogin set status1 =1  where id ="+a);
		
		return true;
		
	}
	public void logout(LoginUser users) {
//		String user = users.getUser();
//		String pass = users.getPass();
		List<Integer> ids = new ArrayList<Integer>();
		String sql="Select id from userlogin where user_id='"+user+"' and password1 = '"+pass+"'";
		ids = template.query(sql,new RowMapper<Integer>() {
			public Integer mapRow(ResultSet rs, int row) throws SQLException {
				
				return rs.getInt(1);
				
			}
		}); 
		int a = ids.get(0);
		template.update("update userlogin set status1 =0  where id ="+a);
		
	}
	public boolean getStatus() {
		List<Integer> ids = new ArrayList<Integer>();
		List<Integer> status = new ArrayList<Integer>();
		user=getUserName();
		pass=getPassWord();
		
		String sql="Select id from userlogin where user_id='"+user+"' and password1 = '"+pass+"'";
		ids = template.query(sql,new RowMapper<Integer>() {
			public Integer mapRow(ResultSet rs, int row) throws SQLException {
				
				return rs.getInt(1);
				
			}
		}); 
		int a = ids.get(0);
		String query="Select status from userlogin where id ="+a;
		status = template.query(sql,new RowMapper<Integer>() {
			public Integer mapRow(ResultSet rs, int row) throws SQLException {
				
				return rs.getInt(1);
				
			}
		}); 
		int stat = status.get(0);
		if(stat==1) {
			return true;
		}
		else {
			return false;
		}
		
	}
}