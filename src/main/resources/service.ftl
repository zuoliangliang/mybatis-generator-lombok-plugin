/**
 * @filename:${entityName}Service ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) 2018 ${author} Co. Ltd. 
 * All right reserved. 
 */
package ${package}.service;

import java.util.List;

import ${package}.model.${entityName};
/**   
 *  
 * @Description:  ${entityComment}——SERVICE
 * @Author:       ${author}   
 * @CreateDate:   ${createTime}
 * @Version:      ${version}
 *    
 */
public interface ${entityName}Service {
	
	/**
	 * @explain 查询${entityComment}对象
	 * @param   id
	 * @return  ${entityName}
	 * @author  ${author}
	 */
	${entityName} selectByPrimaryKey(${idType} id);
	
	/**
	 * @explain 删除${entityComment}对象
	 * @param   id
	 * @return  int
	 * @author  ${author}
	 */
	int deleteByPrimaryKey(${idType} id);

	/**
	* @explain 删除${entityComment}对象
	* @param   ids
	* @return  List<Integer>
	* @author  ${author}
	*/
	int delete(List<Integer> ids) ;

	/**
	 * @explain 添加${entityComment}对象
	 * @param   ${entityName}
	 * @return  int
	 * @author  ${author}
	 */
	int insertSelective(${entityName} ${objectName});
	
	/**
	 * @explain 修改${entityComment}对象
	 * @param   ${entityName}
	 * @return  int
	 * @author  ${author}
	 */
	int updateByPrimaryKeySelective(${entityName} ${objectName});
	
	/**
	 * @explain 查询${entityComment}集合
	 * @param   ${entityName}
	 * @return  List<${entityName}>
	 * @author  ${author}
	 */
	List<${entityName}> selectByExample(${entityName} ${objectName});
}