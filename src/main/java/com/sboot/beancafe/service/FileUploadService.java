package com.sboot.beancafe.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sboot.beancafe.dao.ProductDAO;

@Service
public class FileUploadService {

	@Autowired
	ProductDAO pdao;
	
	public void uploadFile(int p_no, String p_name, int p_price, int p_amount,String description, MultipartFile file) 
			throws IllegalStateException, IOException {
		
		//실제파일저장경로
		String imgPath="C:\\Users\\eldorado\\eclipse-jee-2021-06-workspace\\"
				+ "beancafe_client_p\\src\\main\\resources\\static\\p_img\\" + file.getOriginalFilename();
		file.transferTo(new File(imgPath));
		
		//db저장경로
		String p_imguri="/resources/p_img/"+file.getOriginalFilename();
		pdao.insertProduct(p_no, p_name, p_price, p_amount, p_imguri,description);
		
	}
	
	

}
