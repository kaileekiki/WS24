package org.example.ws242.file;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.example.ws242.vo.FileVO;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileUpload {
    public FileVO uploadFile(HttpServletRequest request) {
        int sizeLimit = 15 * 1024 * 1024; // 15MB
        String realPath = request.getServletContext().getRealPath("upload");

        // 디렉토리 생성
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        try {
            MultipartRequest multipartRequest = new MultipartRequest(
                    request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()
            );

            String filename = multipartRequest.getFilesystemName("filename");
            return new FileVO(filename);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
