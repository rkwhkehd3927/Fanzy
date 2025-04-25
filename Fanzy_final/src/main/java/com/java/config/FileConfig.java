package com.java.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileConfig implements WebMvcConfigurer{
	@Override //images 링가 들어오면, 찾는 위치를 c:upload폴더에서 찾아라
	//C:/worksts/s0212/src/main/resources/static/images/
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
//		registry.addResourceHandler("/images/**")
//		.addResourceLocations("file:///c:/upload/");
		
//		registry.addResourceHandler("/images/**")
//		.addResourceLocations("file:///c:/upload/test/");

		   registry.addResourceHandler("/images/**")
           .addResourceLocations(
               "classpath:/static/images/", // 기존의 static/images 폴더
               "file:///c:/upload/test/"      // 새로 업로드된 파일이 저장되는 폴더
           );
	}
}
