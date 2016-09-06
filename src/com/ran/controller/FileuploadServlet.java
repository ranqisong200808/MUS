package com.ran.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * 文件下载
 * @author j
 *
 */
public class FileuploadServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//创建文件处理工厂对象
		DiskFileItemFactory dff = new DiskFileItemFactory();
		//创建文件上传处理工具
		ServletFileUpload sfu = new ServletFileUpload(dff);
		try {
			//读取请求中的二进制数据返回list集合
			List<FileItem> files = sfu.parseRequest(req);
			for(FileItem fi : files){
				if(fi.isFormField()){
					//判断当前数据是否为普通表单字段(除文件上传之外的其他字段)
					
				}else{
					//文件上传的二进制数据字段
					String fileName = fi.getName();
					String suffix = fileName.substring(fileName.lastIndexOf("."));
					if(".jsp".equalsIgnoreCase(suffix)){//图片格式忽略大小写--待写完
						if(fi.getSize()<=1024*1024*10){//限制文件大小
							Random ran = new Random();//随机数
							int i = ran.nextInt(10000);//0~10000的随机数
							long l = new Date().getTime();//当前系统的毫秒数
							fileName = i + "" + l + suffix;
							
							String path = this.getServletContext().getRealPath("filse")+"/"+fileName;
							File f = new File(path);
							//将二进制数据写入文件保存在硬盘
							fi.write(f);
						}else{
							//文件太大
						}
					}else{
						//格式不对
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
