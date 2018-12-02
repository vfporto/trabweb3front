package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Part;

import util.Configuracao;
import wsclient.RESTConnectionV3;

public class UploadController {

	public String salvar(Part file) {
		RESTConnectionV3 rest = new RESTConnectionV3();
		Map<String,Object> queryParams = new HashMap<String,Object>();
		String url = Configuracao.apiUrl+"/upload/salvar";
		return (String) rest.upload(url, "POST", String.class, file, queryParams);		
	}
	
}
