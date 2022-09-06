package by.itacademy.matveenko.jd2.controller;

import java.io.IOException;

import by.itacademy.matveenko.jd2.util.AttributsName;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	private final CommandProvider provider = new CommandProvider();
       
    public FrontController() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String commandName = request.getParameter(AttributsName.COMMAND_NAME);		
		Command command = provider.getCommand(commandName);
		command.execute(request, response);		
	}	
}