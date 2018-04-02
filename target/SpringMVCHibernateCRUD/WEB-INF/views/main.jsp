<%--
  Created by IntelliJ IDEA.
  User: jacob
  Date: 2018/3/6
  Time: 下午3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>blog</title>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {packages: ["corechart"]});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ['Work', 11],
                ['Eat', 2],
                ['Commute', 2],
                ['Watch TV', 2],
                ['Sleep', 7]
            ]);

            var options = {
                title: 'My Daily Activities',
                pieHole: 0.4,
            };

            var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>

<div class="jumbotron jumbotron-fluid">
    <div class="container">
        <h1 class="display-4">Foot Book</h1>
        <p class="lead">A good place for you to share everything!</p>
    </div>
</div>
<div id="donutchart" style="width: 900px; height: 500px;"></div>
<div class="container">
    <div class="row">
        <div class="col-sm-3">

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">My Info</h5>
                    <h6 class="card-subtitle mb-2 text-muted">ID: ${user.user_id}</h6>
                    <h6 class="card-subtitle mb-2 text-muted">Name: ${user.name}</h6>
                    <h6 class="card-subtitle mb-2 text-muted">Gender: ${user.gender}</h6>
                    <h6 class="card-subtitle mb-2 text-muted">Age: ${user.age}</h6>
                    <h6 class="card-subtitle mb-2 text-muted">Email: ${user.email}</h6>
                </div>
            </div>
        </div>


        <div class="col-sm-6">
            <h2>Blog</h2>
            <c:forEach var="blog" items="${listblog}">
                <blockquote class="blockquote">
                    <p class="mb-0">${blog.title} - ${blog.date}</p>
                    <footer class="blockquote-footer">${blog.content}</footer>
                </blockquote>
            </c:forEach>
        </div>


        <div class="col-sm-3">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-header">Calendar</div>
                        <div class="card-body">
                            <h5 class="card-title">Upcoming events!</h5>
                            <c:forEach var="cal" items="${listcalendar}">
                                <p class="card-text">${cal.start_date} - ${cal.event_title}</p>
                            </c:forEach>
                        </div>
                        <button class="btn btn-success">More events</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="list-group">
                            <a href="#" class="list-group-item active">
                                My blog collection
                            </a>
                            <c:forEach var="blog" items="${collectionBlog}">
                                <a href="#" class="list-group-item list-group-item-action">${blog.title}
                                    - ${blog.date}</a>
                            </c:forEach>

                        </div>

                        <div class="list-group">
                            <a href="#" class="list-group-item active">
                                My twitter collection
                            </a>
                            <c:forEach var="twitter" items="${collectionTwitter}">
                                <a href="#" class="list-group-item list-group-item-action">${twitter.content}
                                    - ${twitter.date}</a>
                            </c:forEach>

                        </div>


                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card text-white bg-success mb-3">
                            <div class="card-header">My friend</div>
                            <div class="card-body">
                                <c:forEach var="friend" items="${myfriend}">
                                    <h5 class="card-title">${friend.name}</h5>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
