<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>信用卡申请</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<script type="">
		$(document).ready(function(){
			contralEffect.contain();
			contralEffect.tablelist();
			contralEffect.blueButton();
		});
	
	</script>
		<style>
		.altclass{background: #E5EFFD;}
		
		.imgDiv {
		    float: left;
		    margin-left: 10px;
		}
		* {
		    font-family: Microsoft yahei;
		    font-size: 12px;
		}
		* {
		    box-sizing: border-box;
		}
		* {
		    margin: 0px;
		    padding: 0px;
		    list-style: outside none none;
		}

		</style>
</head>

<body>
    <div class="padd10">
        <div class="contain">
            <div class="contain_wrap">
            
                <div class="contain_title">
			    	<div class="contain_t_wrap">
			            <div class="float_lef contain_t_text">
			            	<span class="marg_lef5">信用卡申请</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
			    <table>
			    
				    <tbody>
				    <tr>
				    <td>
	              <div class="imgDiv">
	             	 <a target="_blank" href="http://banks.51credit.com/bocomm/"><img src="${ctx}/images/jtyh.png"> <p><span class="bankname"> 95559</span></p></a>
					</div>
	              <div class="imgDiv">
	              	<a target="_blank" href="https://creditcard.cmbc.com.cn/online/card.aspx"><img src="${ctx}/images/msyh.png"><p><span class="bankname">95568</span></p></a>
				  </div>
				  <div class="imgDiv">
	             	 <a target="_blank" href="http://banks.51credit.com/cib/"><img src="${ctx}/images/xyyh.png"> <p><span class="bankname"> 95561</span></p></a>
					</div>
	              <div class="imgDiv">
	              	<a target="_blank" href="http://kaku.51credit.com/tag/indexYHT1001.html"><img src="${ctx}/images/zxyh.png"><p><span class="bankname">95558</span></p></a>
				  </div>
				  <div class="imgDiv">
	             	 <a target="_blank" href="http://kaku.51credit.com/tag/indexYHT1013.html"><img src="${ctx}/images/gdyh.png"> <p><span class="bankname"> 95595</span></p></a>
					</div>
	              <div class="imgDiv">
	              	<a target="_blank" href="http://www.abchina.com/cn/CreditCard/default.htm"><img src="${ctx}/images/nyyh.png"><p><span class="bankname">400-669-5599</span></p></a>
				  </div>
				   <div class="imgDiv">
	              	<a target="_blank" href="http://creditcard.hxb.com.cn/"><img src="${ctx}/images/hxyh.png"><p><span class="bankname">95577</span></p></a>
				  </div>
				</td>
				
				</tr>
				<tr>
					<td>
					 <div class="imgDiv">
	             	 <a target="_blank" href="http://www.spdbccc.com.cn/zh/service/service2_2.htm"><img src="${ctx}/images/pfyh.png"> <p><span class="bankname"> 95528</span></p></a>
					</div>
	              <div class="imgDiv">
	              	<a target="_blank" href="http://kaku.51credit.com/tag/indexYHT1012.html"><img src="${ctx}/images/payh.png"><p><span class="bankname">95511</span></p></a>
				  </div>
				  <div class="imgDiv">
	             	 <a target="_blank" href="http://kaku.51credit.com/tag/indexYHT1002.html"><img src="${ctx}/images/gfyh.png"> <p><span class="bankname"> 95508</span></p></a>
					</div>
	              <div class="imgDiv">
	              	<a target="_blank" href="https://mybank.icbc.com.cn/icbc/perbank/index.jsp"><img src="${ctx}/images/gsyh.png"><p><span class="bankname">95588</span></p></a>
				  </div>
				  <div class="imgDiv">
	             	 <a target="_blank" href="http://creditcard.ccb.com/"><img src="${ctx}/images/jsyh.png"> <p><span class="bankname"> 95533</span></p></a>
					</div>
	              <div class="imgDiv">
	              	<a target="_blank" href="https://apply.mcard.boc.cn/apply/pc/product/list/mc?rp=9&page=1"><img src="${ctx}/images/zgyh.png"><p><span class="bankname">95566</span></p></a>
				  </div>
				  <div class="imgDiv">
	              	<a target="_blank" href="http://banks.51credit.com/cmb/"><img src="${ctx}/images/zsyh.png"><p><span class="bankname">95555</span></p></a>
				  </div>
					</td>
				
				</tr>
				</tbody>
			</table>


            </div>
        </div>
    </div>

    
</body>
</html>
