package com.mkyong.customer.action;
 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import io.daocloud.dmp.apm.client.api.AC;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.springframework.web.struts.ActionSupport;

import com.mkyong.customer.bo.CustomerBo;
import com.mkyong.customer.model.Customer;
 
public class ListCustomerAction extends ActionSupport{
 
	public ActionForward execute(ActionMapping mapping,ActionForm form,
		HttpServletRequest request,HttpServletResponse response) 
        throws Exception {
 
		CustomerBo customerBo =
			(CustomerBo) getWebApplicationContext().getBean("customerBo");
		
		DynaActionForm dynaCustomerListForm = (DynaActionForm)form;
		
		List<Customer> list = customerBo.findAllCustomer();
		
		dynaCustomerListForm.set("customerList", list);

		/***
		 * 业务埋点开始
		 * 发送消息至 kafka
		 */
		AC.initialize(null);
		AC.newEvent("default_flink_output_topic0").put("applyCount", 100).put("region", System.currentTimeMillis() % 9)
				.put("outputMessageName", "apply_result")
				.put("outputMessageNotifyUrl", "http://localhost:9000")
				.put("windowStartTime", System.currentTimeMillis())
				.put("windowEndTime", System.currentTimeMillis())
				.send();
		/**
		 * 业务埋点结束
		 */
	        
		return mapping.findForward("success");
	  
	}
 
}