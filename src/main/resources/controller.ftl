/**
 * @filename:${entityName}Controller ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) 2018 ${author} Co. Ltd. 
 * All right reserved. 
 */
package ${package}.controller;

import java.util.List;
import java.sql.Timestamp;
import java.time.Instant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import com.sr.util.result.ResponseMsg;
import ${package}.model.${entityName};
import ${package}.service.${entityName}Service;

import com.sr.oauth.config.WebAppContext;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

/**   
 * 
 * @Description:  ${entityComment}接口层
 * @Author:       ${author}   
 * @CreateDate:   ${createTime}
 * @Version:      ${version}
 *    
 */
@Api(tags = "${entityName}Controller", description="${entityComment}管理", value = "${entityComment}")
@Slf4j
@RestController
@RequestMapping("/${objectName}")
public class ${entityName}Controller {

	
	@Autowired
	public ${entityName}Service ${objectName}Service;
	
	/**
	 * @explain 查询${entityComment}对象  <swagger GET请求>
	 * @param   id
	 * @return  ${objectName}
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@PostMapping("/detail/{id}")
	@ApiOperation(value = "获取${entityComment}信息", notes = "获取${entityComment}信息[${objectName}]，作者：${author}")
	public ResponseMsg<String, Object> get${entityName}ById(@PathVariable("id")Integer id){
		return ResponseMsg.getInstance(${objectName}Service.selectByPrimaryKey(id));
	}
	
	/**
	 * @explain 添加${entityComment}对象
	 * @param   ${objectName}
	 * @return  int
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@PostMapping("/insert")
	@ApiOperation(value = "添加${entityComment}", notes = "添加${entityComment}[${objectName}],作者：${author}")
	public ResponseMsg<String, Object> insert(@RequestBody ${entityName} ${objectName}){
		${objectName}.setId(null);
		${objectName}.setCreateTime(Timestamp.from(Instant.now()));
		${objectName}.setUpdateTime(null);
		${objectName}.setUpdater(WebAppContext.getLoginUserName());
		return ResponseMsg.getInstance(${objectName}Service.insertSelective(${objectName}));
	}
	
	/**
	 * @explain 删除${entityComment}对象
	 * @param   ids
	 * @return  int
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@PostMapping("/delete")
	@ApiOperation(value = "删除${entityComment}", notes = "删除${entityComment},作者：${author}")
	@ApiImplicitParam(paramType="query", name = "ids", value = "${entityComment}ids", required = true, dataType = "List<${idType}>")
	public ResponseMsg<String, Object> delete(@RequestBody List<Integer> ids){

		return ResponseMsg.getInstance(${objectName}Service.delete(ids));
	}
	
	/**
	 * @explain 修改${entityComment}对象
	 * @param   ${objectName}
	 * @return  ${objectName}
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@ApiOperation(value = "修改${entityComment}", notes = "修改${entityComment}[${objectName}],作者：${author}")
	@PostMapping("/update")
	public ResponseMsg<String, Object> update(@RequestBody ${entityName} ${objectName}){
		Assert.notNull(${objectName}.getId(),"${entityComment}Id不能为空");
		${objectName}.setCreateTime(null);
		${objectName}.setUpdateTime(null);
		${objectName}.setUpdater(WebAppContext.getLoginUserName());
		return ResponseMsg.getInstance(${objectName}Service.updateByPrimaryKeySelective(${objectName}));
	}
	
	/**
	 * @explain 获取匹配${entityComment}
	 * @param   ${objectName}
	 * @return  List<${entityName}>
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@ApiOperation(value = "条件查询${entityComment}", notes = "条件查询[${objectName}],作者：${author}")
	@PostMapping("/search")
	public ResponseMsg<String, Object> search(@RequestBody ${entityName} ${objectName}){
		return ResponseMsg.getInstance(${objectName}Service.selectByExample(${objectName}));
	}
}