<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html>

    <head>
        <title>AQI Data Table</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>

    <body style="background-color: #F0F2F5;">

        <c:if test="${listofdata.isEmpty()}">
            <div class="p-5 bg-primary text-white text-center">
                <h1>Air Qualitys Index</h1>
                <p>Real-time Air Quality data feed</p>

                <div class="d-flex bg-dark-subtle w-50 mx-auto p-2">
                    <form class="d-flex w-75  mx-auto" method="post" action="feeds">
                        <input type="text" name="cityname" placeholder="Enter city name" class=" p-2 col-10">
                        <button class="btn btn-primary fa fa-search bg-primary rounded-0 flex-fill " type="submit"></button>
                    </form>
                </div>

              
        </c:if>



        <c:if test="${listofdata.isEmpty()==false}">
            <div class="p-5 bg-primary text-white text-center">
                <h1>Air Quality Index</h1>
                <p>Real-time Air Quality data feed</p>
            </div>

            <div class="sticky-top d-flex align-content-lg-start bg-dark-subtle p-1">
                <form class="d-flex w-25 me-3" method="post" action="feeds">
                    <input type="text" name="cityname" placeholder="Enter city name" class=" p-2 col-10">
                    <button class="btn btn-primary fa fa-search bg-primary rounded-0 flex-fill " type="submit"></button>
                </form>
                <div class="col-5 my-2 align-self-center">
                    <span style="font-size: larger;">${message}</span>
                </div>
            </div>

            <br>

            <c:forEach items="${listofdata}" var="data">

                <div class="row col-12">

                    <div class="col-sm-12 d-inline-flex row mx-auto mb-5"><!-- first row -->
                        <div class="container mx-auto align-content-center col-sm-4 rounded-3 bg-white shadow"
                            style="height: 450px;">

                            <div class="card border border-0">
                                <div class="d-flex card-body row shadow">
                                    <div class="justify-content-center mx-auto px-2 d-flex container shadow rounded-3 col-sm-3 align-self-center"
                                        <c:if test="${data.data.aqi <= 50}">style="background-color: lightgreen"
        </c:if>
        <c:if test="${data.data.aqi > 50 && data.data.aqi <= 100}">
            style="background-color:yellow"</c:if>
        <c:if test="${data.data.aqi > 100 && data.data.aqi <= 150}">
            style="background-color:orange"</c:if>
        <c:if test="${data.data.aqi > 150 && data.data.aqi <= 200}">
            style="background-color:red"
        </c:if>
        <c:if test="${data.data.aqi > 200 && data.data.aqi <= 300}">
            style="background-color:purple"</c:if>
        <c:if test="${data.data.aqi > 300}">style="background-color:brown"</c:if>>
        <span class="text-align-center text-black" style="font-size: 45px;">
            ${data.data.aqi}
        </span>
        </div>

        <div class="mx-auto col-sm-7">

            <div class="row ">
                <c:if test="${data.data.aqi <= 50}">
                    <span class="display-6">Good</span>
                </c:if>
                <c:if test="${data.data.aqi > 50 && data.data.aqi <= 100}">
                    <span class="display-6">Moderate</span>
                </c:if>
                <c:if test="${data.data.aqi > 100 && data.data.aqi <= 150}">
                    <span style="font-size: x-large;">Unhealthy for Sensitive Groups</span>
                </c:if>
                <c:if test="${data.data.aqi > 150 && data.data.aqi <= 200}">
                    <span class="display-6">Unhealthy</span>
                </c:if>
                <c:if test="${data.data.aqi > 200 && data.data.aqi <= 300}">
                    <span class="display-6">Very Unhealthy</span>
                </c:if>
                <c:if test="${data.data.aqi > 300}"><span class="display-6">Hazardous</span>
                </c:if>
            </div>


            <div class="row">
                <h6><small>Updated on <span class="text-primary">${data.data.time.s}</span></small></h6>
            </div>

        </div>


        </div>
        </div>
        <c:set var="offset" scope="session" value="${data.data.time.getoffsetDateTime()}" />
        <style>
            .widgetcardDay {
                background-image: url("https://media.istockphoto.com/id/855749050/vector/comic-cityscape-light-background.jpg?s=612x612&w=0&k=20&c=H6N3CaN54R0rX2Q18o-oZeVAFsmHwZPQ4rnnNlnBemw=");
                background-repeat: no-repeat;
                background-size: cover;
            }

            .widgetcardNight {
                background-image: url("https://media.istockphoto.com/id/1351985254/vector/full-moon-landscape.jpg?s=612x612&w=0&k=20&c=v8RrJ81Wqj3FEMEIm0oQF5HERauDWB73n2EDy01ukOs=");
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        <div
            class="row border <c:if test='${offset.getHour()>=12}'>widgetcardDay</c:if><c:if test='${offset.getHour()<12}'>widgetcardNight</c:if>">
            <div class="my-3 col-12 d-flex justify-content-start"><a style="text-decoration: none;"
                    href="${data.data.city.url}"><span
                        style="font-size: x-large;color: white;text-shadow: 0 0 15px black;"><small>${data.data.city.name}</small></span></a>
            </div>
            <div class="my-3 col-12 d-flex justify-content-end"><a style="text-decoration: none;"
                    href="${data.data.city.url}"><span class="display-3 text-white"
                        style="text-shadow: 0 0 15px black;">${data.getData().getIaqi().getT().getV()}
                        &degC</span></a>
            </div>
            <div class="my-3 col-12">
                <a style="text-decoration: none;" href="${data.data.city.url}">
                    <span class="display-4 text-white"
                        style="text-shadow: 0 0 15px black;">${offset.getHour()}:${offset.getMinute()}</span><br>
                    <span class="text-white"
                        style="font-size: large;text-shadow: 0 0 15px black;">${offset.getDayOfWeek()},
                        ${offset.getDayOfMonth()} ${offset.getMonth()} ${offset.getYear()}</span>
                </a>
            </div>
        </div>

        </div>


        <div class="container mx-auto align-content-center col-sm-7 rounded-3 bg-white shadow">
            <div class="card border border-0">

                <div class="row d-inline-flex p-3 ">
                    <div class="col-3 p-2">Dominent Pollutant</div>
                    <div class="col-9 p-2 ">${data.data.dominentpol}</div>
                </div>
                <div class="row d-inline-flex p-3 ">
                    <div class="col-2 p-2">Links</div>
                    <div class="col-10 p-2 ">
                        <c:forEach items="${data.data.attributions}" var="attr">
                            <span style="font-size: medium;"><a href="${attr.url}">${attr.name}</a></span>
                            <hr>
                        </c:forEach>
                    </div>
                </div>
                <div class="row d-inline-flex p-3 ">
                    <div class="col-3 p-2">Geo Coordinates</div>
                    <div class="col-9 p-2 ">${data.data.city.geo[0]}, ${data.data.city.geo[1]}</div>
                </div>
                <div class="row d-inline-flex p-3 ">
                    <div class="col-3 p-2">Timezone</div>
                    <div class="col-9 p-2 ">${data.data.time.tz}</div>
                </div>


            </div>
        </div>
        </div>

        <div class="col-sm-12 d-inline-flex row mx-auto mb-5"><!-- second row -->
            <div class="container col-sm-10 rounded-3  bg-white shadow">
                <div class="card border border-0">
                    <h4>IAQI</h4>

                    <div class="row d-inline-flex p-3 ">
                        <div class="col-6 p-2"><b>Carbon monoxide (co)</b> :
                            ${data.getData().getIaqi().getCo().getV()}
                        </div>
                        <div class="col-6 p-2 "><b>dew</b> : ${data.getData().getIaqi().getDew().getV()}</div>
                        <div class="col-6 p-2"><b>Relative Humidity (h)</b> :
                            ${data.getData().getIaqi().getH().getV()}
                        </div>
                        <div class="col-6 p-2 "><b>Nitrogen Dioxide (no2)</b> :
                            ${data.getData().getIaqi().getNo2().getV()}</div>
                        <div class="col-6 p-2 "><b>Ozone (o3)</b> : ${data.getData().getIaqi().getO3().getV()}
                        </div>
                        <div class="col-6 p-2"><b>Atmospheric Pressure (p)</b> :
                            ${data.getData().getIaqi().getP().getV()}</div>
                        <div class="col-6 p-2 "><b>PM10</b> : ${data.getData().getIaqi().getPm10().getV()}</div>
                        <div class="col-6 p-2"><b>PM2.5</b> : ${data.getData().getIaqi().getPm25().getV()}</div>
                        <div class="col-6 p-2 "><b>Sulfur dioxide (so2) </b> :
                            ${data.getData().getIaqi().getSo2().getV()}</div>
                        <div class="col-6 p-2 "><b>Temperature (t)</b> :
                            ${data.getData().getIaqi().getT().getV()}
                        </div>
                        <div class="col-6 p-2"><b>Wind Speed (w)</b> : ${data.getData().getIaqi().getW().getV()}
                        </div>
                        <div class="col-6 p-2 "><b>Gust Wind Speed (wg)</b> :
                            ${data.getData().getIaqi().getWg().getV()}
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-sm-12 d-inline-flex row mx-auto mb-5"><!-- THIRD row -->
            <div class="container col-sm-10 rounded-3  bg-white shadow">
                <div class="card border border-0">
                    <h4>Forecast - Ozone (O3)</h4>
                    <table>
                        <tr>
                            <th>Date</th>
                            <th>Avg</th>
                            <th>Max</th>
                            <th>Min</th>
                        </tr>
                        <c:forEach items="${data.data.forecast.daily.o3}" var="o3">
                            <tr>
                                <td>${o3.day}</td>
                                <td>${o3.avg}</td>
                                <td>${o3.max}</td>
                                <td>${o3.min}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-sm-12 d-inline-flex row mx-auto mb-5"><!-- FOURTH row -->
            <div class="container col-sm-10 rounded-3  bg-white shadow">
                <div class="card border border-0">
                    <h4>Forecast - PM10</h4>
                    <table>
                        <tr>
                            <th>Date</th>
                            <th>Avg</th>
                            <th>Max</th>
                            <th>Min</th>
                        </tr>
                        <c:forEach items="${data.data.forecast.daily.pm10}" var="pm10">
                            <tr>
                                <td>${pm10.day}</td>
                                <td>${pm10.avg}</td>
                                <td>${pm10.max}</td>
                                <td>${pm10.min}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-sm-12 d-inline-flex row mx-auto mb-5"><!-- FIFTH row -->
            <div class="container col-sm-10 rounded-3  bg-white shadow">
                <div class="card border border-0">
                    <h4>Forecast - PM2.5</h4>
                    <table>
                        <tr>
                            <th>Date</th>
                            <th>Avg</th>
                            <th>Max</th>
                            <th>Min</th>
                        </tr>
                        <c:forEach items="${data.data.forecast.daily.pm25}" var="pm25">
                            <tr>
                                <td>${pm25.day}</td>
                                <td>${pm25.avg}</td>
                                <td>${pm25.max}</td>
                                <td>${pm25.min}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

        </div>
        </div>


        <hr><br>
        </c:forEach>
        </c:if>
    </body>

    </html>