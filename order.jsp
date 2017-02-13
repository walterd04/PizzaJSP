<%-- 
    Document   : order
    Created on : Feb 13, 2017, 8:44:07 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Devin's Pizza Order</title>
    </head>
    <body>
        <h1>Order Results</h1>
        
        <p>Email = ${param.email}</p>
        <p>Size = ${param.size}</p>
        <p>Crust = ${param.crust}</p>
        
        <%
            String toppings[] = request.getParameterValues("toppings");
            if(toppings != null && toppings.length != 0){
                out.println("<p>Toppings: ");
                for (String myTopping : toppings){
                    out.println(myTopping + ", ");
                }
                out.println("</p>");
            }
            
            double total = 0.0;
            String crust = request.getParameter("crust");
            String size = request.getParameter("size");
            
            if (size.equalsIgnoreCase("large")){
                total = total + 7.00;
            } else if (size.equalsIgnoreCase("medium")){
                total = total + 6.00;
            } else if (size.equalsIgnoreCase("small")){
                total = total + 5.00;
            }
            
            if(crust.equalsIgnoreCase("pan")){
                total = total + 1.00;
            } else if(crust.equalsIgnoreCase("hand")){
                total = total + .50;
            }
            
            if(toppings != null && toppings.length != 0){
                for(String myTopping : toppings){
                    total += .75;
                }
            }
            
            out.println("<p>Total Cost: $" + total + "</p>");
        %>
    </body>
</html>
