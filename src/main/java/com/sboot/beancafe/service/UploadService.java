package com.sboot.beancafe.service;

import java.io.File;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sboot.beancafe.dao.ProductDAO;

@Service
public class UploadService {

	@Autowired
	ProductDAO pdao;

	// 파일등록 + db등록
	public void excute(int p_no, String p_name, int p_price, int p_amount, String description,MultipartFile file) throws IllegalStateException, IOException {
		
		//아래 적은 경로는 내 컴퓨터 기준 즉 본인 컴퓨터 경로로 수정해야 사용가능하다
		//static->p_img 폴더 클릭 후 우클릭 -> 맨 아래 properties -> location 우측에 폴더이동 -> 
		//폴더 이동후 주소창 복사 후 붙여넣기 -> 경로 끝부분에 p_img\\ 추가 -> +file.getOriginalFilename(); 추가
		//여기서 file은 controller에서 넘어온 MultipartFile file임
		String filePath = "C:\\Users\\eldorado\\eclipse-jee-2021-06-workspace\\"
				+ "beancafe_client_p\\src\\main\\resources\\static\\p_img\\"+file.getOriginalFilename();
		//여기서는 실제로 위의 경로대로 저장
		//사실 이부분에서는 try catch 로 예외상황에서 따로 작업해줘야하는데 편의상 throws로 처리 
		//지금까지 에러난적 1번도 없다
		//참고로 파일 업로드에 성공하고 현재 플젝에 파일 들어왔는지 아닌지 확인하려면 maven update해야 확인가능(새로고침)
		 file.transferTo(new File(filePath));
		
		 //실제로 db에 저장되는 경로 이렇게 db에 저장되어야 호출할때 바로 출력 가능하다
		 //img 호출 부분이 기본 경로가 resource/static이기 때문 
		 String filePath2 = "p_img/"+file.getOriginalFilename();
		 
		 //이런식으로 service에서 바로 db에 저장해야 파일업로드와 db등록이 동시에 이루어 진다
		 //여기 컴퓨터에서는 table 정보도 없고 db 설정도 어떻게 되어있는지 모르기 때문에 본인 플젝상황에 맞춰서
		 //수정하길 바람
		 pdao.insertProduct(p_no, p_name, p_price, p_amount, description,filePath2);
		
		

	}

}
