package controller;

import java.util.HashMap;
import java.util.Map;

import model.FuncionarioModel;
import wsclient.RESTConnectionV2;

public class LoginController {
	
	public FuncionarioModel validarLogin(String login, String senha) {
		RESTConnectionV2 rest = new RESTConnectionV2();
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("login", login);
		queryParams.put("senha", senha);
		String url = "http://localhost:8080/FuncionarioBack/api/login/validar";
		FuncionarioModel lista = (FuncionarioModel) rest.getObject(url, "GET", FuncionarioModel.class, null, queryParams);
		return lista;
		
	}

}
