/**
 * @filename:${entityName}ServiceImpl ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) 2018 ${author} Co. Ltd. 
 * All right reserved. 
 */
package ${package}.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import ${package}.model.${entityName};
import ${package}.model.${entityName}Example;
import ${package}.mapper.${entityName}Mapper;
import ${package}.service.${entityName}Service;

/**   
 *  
 * @Description:  ${entityComment}——SERVICEIMPL
 * @Author:       ${author}   
 * @CreateDate:   ${createTime}
 * @Version:      ${version}
 *    
 */
@Service
public class ${entityName}ServiceImpl implements ${entityName}Service {

	@Autowired
	private ${entityName}Mapper ${objectName}Mapper;
	
	//查询对象
	@Override
	public ${entityName} selectByPrimaryKey(${idType} id) {
		return ${objectName}Mapper.selectByPrimaryKey(id);
	}

	//删除对象
	@Override
	public int deleteByPrimaryKey(${idType} id) {
		return ${objectName}Mapper.deleteByPrimaryKey(id);
	}

	@Override
	public int delete(List<Integer> ids) {
		${entityName}Example example = new ${entityName}Example();
		example.or().andIdIn(ids);
		return ${objectName}Mapper.deleteByExample(example);
	}
	
	//添加对象
	@Override
	public int insertSelective(${entityName} ${objectName}) {
		return ${objectName}Mapper.insertSelective(${objectName});
	}
	
	//修改对象
	@Override
	public int updateByPrimaryKeySelective(${entityName} ${objectName}) {
		return ${objectName}Mapper.updateByPrimaryKeySelective(${objectName});
	}

	//分页查询
	@Override
	public List<${entityName}> selectByExample(${entityName} ${objectName}) {

		PageHelper.startPage(${objectName}.getPageNum(), ${objectName}.getPageSize());
		${entityName}Example example = new ${entityName}Example();
		${entityName}Example.Criteria criteria = example.createCriteria();
<#--		example.setOrderByClause("update_time desc");-->

		return ${objectName}Mapper.selectByExample(example);
	}
}