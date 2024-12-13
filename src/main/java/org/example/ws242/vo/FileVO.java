package org.example.ws242.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileVO {
    private int id;
    private String title;
    private String filename;

    public FileVO(String title, String filename) {
        this.title = title;
        this.filename = filename;
    }

}