package edu.homeEducation.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping; 

@Controller
public class CompilerController {

	@RequestMapping("/compile")
	public void  execute(HttpServletRequest request) {
		String code = request.getParameter("script");
	String clientId = "eec87b50390f4dca093eeb3863992455"; //Replace with your client ID
    String clientSecret = "f522e1d6a6f56c0e9f0f1f2cecdcedd1c4687afcfe4775f002b8d1e70433cdba"; //Replace with your client Secret
    String script = request.getParameter("script");
    String language = "java";
    String versionIndex = "0";
 
    try {
        URL url = new URL("https://api.jdoodle.com/v1/execute");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection(); 
        connection.setDoOutput(true);
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");

        String input = "{\"clientId\": \"" + clientId + "\",\"clientSecret\":\"" + clientSecret + "\",\"script\":\"" + script +
        "\",\"language\":\"" + language + "\",\"versionIndex\":\"" + versionIndex + "\"} ";

        System.out.println(input);

        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(input.getBytes());
        outputStream.flush();

        if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
            throw new RuntimeException("Please check your inputs : HTTP error code : "+ connection.getResponseCode());
        }

        BufferedReader bufferedReader;
        bufferedReader = new BufferedReader(new InputStreamReader(
        (connection.getInputStream())));

        String output;
        System.out.println("Output from JDoodle .... \n");
        while ((output = bufferedReader.readLine()) != null) {
            System.out.println(output);
        }

        connection.disconnect();

    } catch (MalformedURLException ex) {
        ex.printStackTrace();
    } catch (IOException e) {
        e.printStackTrace();
    }
}
}
