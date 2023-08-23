<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html>

    <head>
        <title>AQI Data Table</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>

    <body style="background-color: #F0F2F5;">

        <c:if test="${listofdata.isEmpty()}">
            <div class="p-5 bg-primary text-white text-center">
                <h1>Air Qualitys Index</h1>
                <p>Real-time Air Quality data feed</p>

                <div class="d-flex bg-dark-subtle col-4 mx-auto p-2">
                    <form class="d-flex w-100  mx-auto" method="post" action="feeds">
                        <input type="text" name="cityname" placeholder="Enter city name" class=" p-2 col-10">
                        <button class="btn btn-primary fa fa-search bg-primary rounded-0 flex-fill "
                            type="submit"></button>
                    </form>
                </div>
        </c:if>

        <c:if test="${listofdata.isEmpty()==false}">
            <div class="p-5 bg-primary text-white text-center">
                <div class="hovereffect">
                    <div class="overlay">
                        <h1>Air Quality Index</h1>
                        <p>Real-time Air Quality data feed</p>
                    </div>
                </div>
            </div>



            <div class="sticky-top d-flex align-content-lg-start bg-dark-subtle p-1">
                <form class="d-flex w-25 me-3" method="post" action="feeds">
                    <input type="text" name="cityname" placeholder="Enter city name" class=" p-2 col-10">
                    <button class="btn btn-primary fa fa-search bg-primary rounded-0 flex-fill " type="submit"></button>
                </form>
                <div class="col-5 my-2 align-self-center fa fa-map-marker">
                    <span style="font-size: large;"> ${message}</span>
                </div>
            </div>

            <br>

            <c:forEach items="${listofdata}" var="data">

                <c:if test="${listofdata[0]!=data}">
                    <div class="d-flex align-content-lg-start bg-dark-subtle p-1">
                        <div class="col-5 my-2 m-5 align-self-center fa fa-map-marker">
                            <span style="font-size: large;"> ${data.data.city.name}</span>
                        </div>
                    </div>
                    <br>
                </c:if>

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
            .widgetcardMorning {
                background-image: url("https://cdn.dribbble.com/userupload/4243243/file/original-fa8ca68e8bea23bba849304202f7fecf.jpeg?resize=400x300&vertical=center");
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;

            }

            .widgetcardAfternoon {
                background-image: url("https://cdn.dribbble.com/users/1526156/screenshots/14572539/media/e5db42e5793729bdc67df4cb057c5d88.jpg?resize=400x300&vertical=center");
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }

            .widgetcardEvening {
                background-image: url("https://cdn.dribbble.com/users/1684108/screenshots/14890865/media/42c940a5093026b154ecee77444d607b.jpg?resize=400x300&vertical=center");
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }

            .widgetcardNight {
                background-image: url("https://cdn.dribbble.com/users/288987/screenshots/13797725/campfire.png?resize=400x300&vertical=center");
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }

            .bg-yellow {
                background-color: #01db5b8b;
            }

            .bg-purple {
                background-color: purple;
            }

            .bg-brown {
                background-color: brown;
            }
        </style>

        <div class="row border 
                                <c:if test='${offset.getHour()>=5 && offset.getHour()<12}'>widgetcardMorning</c:if>
                                <c:if test='${offset.getHour()>=12 && offset.getHour()<17}'>widgetcardAfternoon</c:if>
                                <c:if test='${offset.getHour()>=17 && offset.getHour()<21}'>widgetcardEvening</c:if>
                                <c:if test='${offset.getHour()>=21 && offset.getHour()<24}'>widgetcardNight</c:if>
                                <c:if test='${offset.getHour()>=0 && offset.getHour()<5}'>widgetcardNight</c:if>">
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
                <h4>IAQI</h4>
                <div class="card border border-0  m-2 p-2 bg-dark-subtle">
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
            <div class="container col-sm-10 rounded-3 bg-white shadow">
                <h4>Forecast - Ozone (O3)</h4>
                <div class="card border border-0 m-2 p-2 bg-dark-subtle">
                    <table>
                        <tr>
                            <th>Date</th>
                            <th>Avg</th>
                            <th>Max</th>
                            <th>Min</th>
                        </tr>
                        <c:forEach items="${data.data.forecast.daily.o3}" var="o3">

                            <c:set var="o3avg" value="${(o3.avg < 50) ? 'bg-success' :
                                                                            (o3.avg > 50 && o3.avg <= 100) ? 'bg-yellow' :
                                                                            (o3.avg > 100 && o3.avg <= 150) ? 'bg-warning' : 
                                                                            (o3.avg > 150 && o3.avg <= 200) ? 'bg-danger' : 
                                                                            (o3.avg > 200 && o3.avg <= 300) ? 'bg-purple' :
                                                                            (o3.avg > 300) ? 'bg-brown' : ''}" />

                            <c:set var="o3max" value="${(o3.max < 50) ? 'bg-success' :
                                                                            (o3.max > 50 && o3.max <= 100) ? 'bg-yellow' :
                                                                            (o3.max > 100 && o3.max <= 150) ? 'bg-warning' : 
                                                                            (o3.max > 150 && o3.max <= 200) ? 'bg-danger' : 
                                                                            (o3.max > 200 && o3.max <= 300) ? 'bg-purple' :
                                                                            (o3.max > 300) ? 'bg-brown' : ''}" />

                            <c:set var="o3min" value="${(o3.min < 50) ? 'bg-success' :
                                                                            (o3.min > 50 && o3.min <= 100) ? 'bg-yellow' :
                                                                            (o3.min > 100 && o3.min <= 150) ? 'bg-warning' : 
                                                                            (o3.min > 150 && o3.min <= 200) ? 'bg-danger' : 
                                                                            (o3.min > 200 && o3.min <= 300) ? 'bg-purple' :
                                                                            (o3.min > 300) ? 'bg-brown' : ''}" />

                            <tr>
                                <td class="bg-dark-subtle">${o3.day}</td>
                                <td class="${o3avg} border border-white text-white">${o3.avg}</td>
                                <td class="${o3max} border border-white text-white">${o3.max}</td>
                                <td class="${o3min} border border-white text-white">${o3.min}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-sm-12 d-inline-flex row mx-auto mb-5"><!-- FOURTH row -->
            <div class="container col-sm-10 rounded-3  bg-white shadow">
                <h4>Forecast - PM10</h4>
                <div class="card border border-0 m-2 p-2 bg-dark-subtle">
                    <table>
                        <tr class="bg-dark-subtle">
                            <th>Date</th>
                            <th>Avg</th>
                            <th>Max</th>
                            <th>Min</th>
                        </tr>
                        <c:forEach items="${data.data.forecast.daily.pm10}" var="pm10">

                            <c:set var="pm10avg" value="${(pm10.avg < 50) ? 'bg-success' :
                                                                            (pm10.avg > 50 && pm10.avg <= 100) ? 'bg-yellow' :
                                                                            (pm10.avg > 100 && pm10.avg <= 150) ? 'bg-warning' : 
                                                                            (pm10.avg > 150 && pm10.avg <= 200) ? 'bg-danger' : 
                                                                            (pm10.avg > 200 && pm10.avg <= 300) ? 'bg-purple' :
                                                                            (pm10.avg > 300) ? 'bg-brown' : ''}" />

                            <c:set var="pm10max" value="${(pm10.max < 50) ? 'bg-success' :
                                                                            (pm10.max > 50 && pm10.max <= 100) ? 'bg-yellow' :
                                                                            (pm10.max > 100 && pm10.max <= 150) ? 'bg-warning' : 
                                                                            (pm10.max > 150 && pm10.max <= 200) ? 'bg-danger' : 
                                                                            (pm10.max > 200 && pm10.max <= 300) ? 'bg-purple' :
                                                                            (pm10.max > 300) ? 'bg-brown' : ''}" />

                            <c:set var="pm10min" value="${(pm10.min < 50) ? 'bg-success' :
                                                                            (pm10.min > 50 && pm10.min <= 100) ? 'bg-yellow' :
                                                                            (pm10.min > 100 && pm10.min <= 150) ? 'bg-warning' : 
                                                                            (pm10.min > 150 && pm10.min <= 200) ? 'bg-danger' : 
                                                                            (pm10.min > 200 && pm10.min <= 300) ? 'bg-purple' :
                                                                            (pm10.min > 300) ? 'bg-brown' : ''}" />

                            <tr>
                                <td class="bg-dark-subtle">${pm10.day}</td>
                                <td class="${pm10avg} border border-white text-white">${pm10.avg}</td>
                                <td class="${pm10max} border border-white text-white">${pm10.max}</td>
                                <td class="${pm10min} border border-white text-white">${pm10.min}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-sm-12 d-inline-flex row mx-auto mb-5"><!-- FIFTH row -->
            <div class="container col-sm-10 rounded-3  bg-white shadow">
                <h4>Forecast - PM2.5</h4>
                <div class="card border border-0 m-2 p-2 bg-dark-subtle">
                    <table>
                        <tr class="bg-dark-subtle">
                            <th>Date</th>
                            <th>Avg</th>
                            <th>Max</th>
                            <th>Min</th>
                        </tr>
                        <c:forEach items="${data.data.forecast.daily.pm25}" var="pm25">

                            <c:set var="pm25avg" value="${(pm25.avg < 50) ? 'bg-success' :
                                                                            (pm25.avg > 50 && pm25.avg <= 100) ? 'bg-yellow' :
                                                                            (pm25.avg > 100 && pm25.avg <= 150) ? 'bg-warning' : 
                                                                            (pm25.avg > 150 && pm25.avg <= 200) ? 'bg-danger' : 
                                                                            (pm25.avg > 200 && pm25.avg <= 300) ? 'bg-purple' :
                                                                            (pm25.avg > 300) ? 'bg-brown' : ''}" />

                            <c:set var="pm25max" value="${(pm25.max < 50) ? 'bg-success' :
                                                                            (pm25.max > 50 && pm25.max <= 100) ? 'bg-yellow' :
                                                                            (pm25.max > 100 && pm25.max <= 150) ? 'bg-warning' : 
                                                                            (pm25.max > 150 && pm25.max <= 200) ? 'bg-danger' : 
                                                                            (pm25.max > 200 && pm25.max <= 300) ? 'bg-purple' :
                                                                            (pm25.max > 300) ? 'bg-brown' : ''}" />

                            <c:set var="pm25min" value="${(pm25.min < 50) ? 'bg-success' :
                                                                            (pm25.min > 50 && pm25.min <= 100) ? 'bg-yellow' :
                                                                            (pm25.min > 100 && pm25.min <= 150) ? 'bg-warning' : 
                                                                            (pm25.min > 150 && pm25.min <= 200) ? 'bg-danger' : 
                                                                            (pm25.min > 200 && pm25.min <= 300) ? 'bg-purple' :
                                                                            (pm25.min > 300) ? 'bg-brown' : ''}" />

                            <tr class="">
                                <td class="bg-dark-subtle">${pm25.day}</td>
                                <td class="${pm25avg} border text-white">${pm25.avg}</td>
                                <td class="${pm25max} border text-white">${pm25.max}</td>
                                <td class="${pm25min} border text-white">${pm25.min}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

        </div>
        </div>

        <br>

        </c:forEach>
        </c:if>
    </body>

    </html>