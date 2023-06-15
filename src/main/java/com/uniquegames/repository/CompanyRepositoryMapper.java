package com.uniquegames.repository;

import com.uniquegames.vo.CompanyVo;
import java.util.List;
import java.util.Optional;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyRepositoryMapper {

   @Insert("insert into member(email, name, password) values(#{email}, #{name}, #{password})")
   @Options(useGeneratedKeys = true, keyProperty = "id")
   void save(CompanyVo company);

//   @Select("select * from member where id = #{findId}")
//   CompanyVo findById(Long findId);

   @Select("select * from company where company_id = #{company_id}")
   CompanyVo findById(String company_id);

   @Select("select * from company")
   List<CompanyVo> findAll();

   @Select("select * from company where email = #{email} and name = #{name}")
   CompanyVo findByEmailAndName(String email, String name);

   @Select("update company set name=#{name}, password=#{oldPassword} where email=#{company_id}")
   Integer update(CompanyVo company);
   
   @Select("select count(*) from member where member_id = #{member_id} and password = #{password}")
   int passEqual(CompanyVo company);

}
