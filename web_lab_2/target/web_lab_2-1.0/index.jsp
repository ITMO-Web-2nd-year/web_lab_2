<%@ page import="ru.arina.maxim.model.Point" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.Writer" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
    
    <head>
        <title>lab_2</title>
        <meta charset="utf-8">
        
        <link rel="stylesheet" type="text/css" href="./css/style.css">
    </head>
    
    
    <body>
        <header>
            <h1 class="header-title">Лабораторная работа №2 по Веб-программированию.</h1>
            <p class="header-content">
                <span class="line-title">Вариант:</span> 4553
                <br>
                <span class="line-title">Студенты:&nbsp;</span> Арина Стенина и Максим Монахов
                <br>
                <span class="line-title">Группа:&nbsp;&nbsp;&nbsp;  </span> P3211
                
            </p>
        </header>
        
        <main>
            <article>
                
                    
                  <canvas id="canvass" width="340" height="340">    <p>Your browser doesn't support canvas.</p>   </canvas>
                    
                <section class="coordinates-view">
                    <p>
                        X : &nbsp;<span class="x">?</span>
                        <br>
                        Y : &nbsp;<span class="y">?</span>
                    </p>
                
                </section>
                



                <section class="message-box-note">
                    <p class="message-box-content">Значения X и Y будут автоматически округлены до ближайших разрешенных.</p>
                </section>
                
                
                <form id="form" action="controllerServlet">
                    
                    <section class="content">
                        
                        <section class="choose-values">

                            <span class="line-title">Значение Х:</span>

                            <section class="checkbox-values x">

                                <input value="-2" name="x" type="button">

                                <input value="-1.5" name="x" type="button">

                                <input value="-1" name="x" type="button">

                                <input value="-0.5" name="x" type="button">

                                <input value="0" name="x" type="button">

                                <input value="1.5" name="x" type="button">

                                <input value="2" name="x" type="button">


                            </section>

                        </section>


                        <section class="choose-values">
                            <span class="line-title">Значение Y (из диапазона (-3..3) ):</span>
                            <input class="checkbox-values y" type="text" name="y" maxlength="10" pattern="-{0,1}[0-9]+[\.,]{0,1}[0-9]*" required title="Введите целое число или десятичную дробь. В качестве дробного разделителя используйте запятую ',' или точку '.'">
                        </section>


                        <section class="choose-values">

                            <span class="line-title">Значение R:</span>

                            <section class="checkbox-values r">
                                
                                <input id="r1" value="1" name="r" type="checkbox">
                                <label for="r1">1</label>
                                
                                <input id="r2" value="2" name="r" type="checkbox">
                                <label for="r2">2</label>
                                
                                <input id="r3" value="3" name="r" type="checkbox">
                                <label for="r3">3</label>

                                <input id="r4" value="4" name="r" type="checkbox">
                                <label for="r4">4</label>
                                
                                <input id="r5" value="5" name="r" type="checkbox">
                                <label for="r5">5</label>
                            </section>

                        </section>
                        
                    </section>


                    <br>
                    <input type="submit" id="submit-button" value="ПРОВЕРИТЬ">


                    <section class="message-box">
                        <p class="message-box-content"></p>
                    </section>
                    
                </form>

            </article>
            
            
            
            
            <article>
                
                <table id="result-table">
                    <thead>
                        <tr>
                            <th scope="col">X</th>
                            <th scope="col">Y</th>
                            <th scope="col">R</th>
                            <th scope="col">Точка попала в область</th>
                        </tr>
                    </thead>

                    <tbody>




                    <%

                        System.out.println(6);
                        ArrayList<Point> history = (ArrayList<Point>) request.getSession().getAttribute("history");
                        System.out.println(7);

//                        if (history == null) {
//                            history = new ArrayList<>();
//                        }
                        System.out.println("history = \n" + history + "\n--------");



                        StringBuilder output = new StringBuilder();
                        Point point;
                        String resultClass = "";


                        for (int i = history.size() - 1; i >= 0; i--) {
                            point = history.get(i);

                            if (point.getResult().equals("ДА")) {
                                resultClass = "server-answer-yes";
                            } else {
                                resultClass = "server-answer-no";
                            }

                            output.append(
                                    "<tr>" +

                                            "<td>" + point.getX() + "</td>" +
                                            "<td>" + point.getY() + "</td>" +
                                            "<td>" + point.getR() + "</td>" +
                                            String.format("<td class='%s'>", resultClass) + point.getResult() + "</td>" +
                                            "</tr>"
                                    );
                        }

                        out.println(output.toString());
                    %>


                    </tbody>
                </table>

            </article>
            
            
        </main>
        
        
        <footer>
            <p class="footer-text"> View code on GitHub</p>
            <a href="https://github.com/ITMO-Web-2nd-year/web_lab_2" target="_blank"> <img class="github-link-img" src="resources/GitHub-Mark-32px.png"> </a>
        </footer>
        
<!--
        <script>
            $(document).ready
        </script>
-->
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
        
        <script src="js/index.js"></script>
    </body>
</html>