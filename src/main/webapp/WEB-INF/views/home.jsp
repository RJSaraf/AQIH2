<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html>

    <head>
        <title>AQI Data Table</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th,
            td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>

    <body>
        <h1>AQI Data Table</h1>

        <form method="post" action="feeds">
            <input type="text" name="cityname" placeholder="Enter city name">
            <input type="submit" value="Submit">
        </form>
        <br>
        <h4>${message}</h4>
        <c:forEach items="${listofdata}" var="data">
            <table>
                <h4>${data.data.city.name}</h4>
                <tr>
                    <th>Property</th>
                    <th>Value</th>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>${data.status}</td>
                </tr>
                <tr>
                    <td>AQI</td>
                    <td>${data.data.aqi}</td>
                </tr>
                <tr>
                    <td>Index</td>
                    <td>${data.data.idx}</td>
                </tr>
                <tr>
                    <td>Dominent Pollutant</td>
                    <td>${data.data.dominentpol}</td>
                </tr>
                <tr>
                    <td>Attributions</td>
                    <td>
                        <ul>
                            <c:forEach items="${data.data.attributions}" var="attr">
                                <li><a href="${attr.url}">${attr.name}</a></li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><a href="${data.data.city.url}">${data.data.city.name}</a></td>
                </tr>
                <tr>
                    <td>Geo Coordinates</td>
                    <td>${data.data.city.geo[0]}, ${data.data.city.geo[1]}</td>
                </tr>
                <tr>
                    <td>IAQI</td>
                    <td>
                        <ul>
                            <li><b>co</b> : ${data.getData().getIaqi().getCo().getV()}</li>
                            <li><b>dew</b> : ${data.getData().getIaqi().getDew().getV()}</li>
                            <li><b>h</b> : ${data.getData().getIaqi().getH().getV()}</li>
                            <li><b>o3</b> : ${data.getData().getIaqi().getO3().getV()}</li>
                            <li><b>p</b> : ${data.getData().getIaqi().getP().getV()}</li>
                            <li><b>pm10</b> : ${data.getData().getIaqi().getPm10().getV()}</li>
                            <li><b>pm25</b> : ${data.getData().getIaqi().getPm25().getV()}</li>
                            <li><b>so2</b> : ${data.getData().getIaqi().getSo2().getV()}</li>
                            <li><b>t</b> : ${data.getData().getIaqi().getT().getV()}</li>
                            <li><b>w</b> : ${data.getData().getIaqi().getW().getV()}</li>
                            <li><b>wg</b> : ${data.getData().getIaqi().getWg().getV()}</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Time</td>
                    <td>${data.data.time.s}</td>
                </tr>
                <tr>
                    <td>Forecast - Ozone (O3)</td>
                    <td>
                        <ul>
                            <c:forEach items="${data.data.forecast.daily.o3}" var="o3">
                                <li>${o3.day}: avg=${o3.avg}, max=${o3.max}, min=${o3.min}</li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Forecast - PM10</td>
                    <td>
                        <ul>
                            <c:forEach items="${data.data.forecast.daily.pm10}" var="pm10">
                                <li>${pm10.day}: avg=${pm10.avg}, max=${pm10.max}, min=${pm10.min}</li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Forecast - PM2.5</td>
                    <td>
                        <ul>
                            <c:forEach items="${data.data.forecast.daily.pm25}" var="pm25">
                                <li>${pm25.day}: avg=${pm25.avg}, max=${pm25.max}, min=${pm25.min}</li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
            </table><br>
        </c:forEach>
    </body>

    </html>