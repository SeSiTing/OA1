package com.util;

import com.github.pagehelper.PageInfo;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class FenyeTagUtil extends SimpleTagSupport {
    private String url;//请求地址

    private PageInfo pageInfo;//保存分页所需的数据

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }

    //重写doTag
    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = this.getJspContext().getOut();
        StringBuffer stringBuffer = new StringBuffer();
        //首页  上一页
        stringBuffer.append("<li class='first-child'><a href='"+url+"&pageindex=1&pagesize="+pageInfo.getPageSize()+"'>首页</a></li>");
        stringBuffer.append("<li class=''><a href='"+url+"&pageindex="+(pageInfo.getPrePage()==0?1:pageInfo.getPrePage())+"&pagesize="+pageInfo.getPageSize()+"'>上一页</a></li>");

        //中间页码
        for ( int i = 1;i<=pageInfo.getPages();i++) {
            stringBuffer.append("<li><a  href='" + url + "&pageindex=" + i + "&pagesize=" + pageInfo.getPageSize() + "'> "+i+" </a></li>");
        }

        //下一页  尾页
        stringBuffer.append("<li><a href='"+url+"&pageindex="+(pageInfo.getNextPage()==0?pageInfo.getPages():pageInfo.getNextPage())+"&pagesize="+pageInfo.getPageSize()+"'>下一页</a></li>");
        stringBuffer.append("<li><a href='"+url+"&pageindex="+pageInfo.getPages()+"&pagesize="+pageInfo.getPageSize()+"'>尾页</a></li>");
        stringBuffer.append("<li><span>共"+pageInfo.getTotal()+"条</span></li>");

        out.print(stringBuffer.toString());
    }
}
