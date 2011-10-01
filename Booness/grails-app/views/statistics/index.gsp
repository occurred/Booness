<%@page import="fr.booness.param.LogType"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="main" />

<title>
	Statistiques ${params.logType} ${params.start}-${params.end}
</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart", "table"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Mois');
        data.addRows(${dateset.size()+1});
        <g:each in='${stats.keySet()}' var='user'>data.addColumn('number', '${user}');
        </g:each>

        <g:each in="${dateset}" var="date" status="i">data.setValue(${i}, 0, '${date}');
        </g:each>

        <g:each in="${stats.keySet()}" var="user" status="i"><g:each in="${new TreeSet(stats[user].keySet())}" var="date" status="j">data.setValue(${j},${i+1},${stats[user][date]});</g:each>
        </g:each> 
        
        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, {legend:'top', lineWidth:0, areaOpacity:0.8, chartArea:{left:50, top:50, width:"90%", height:"85%"}, isStacked:true, hAxis:{showTextEvery:12}, width: 1200, height: 600, title: 'Statistiques ${params.logType} ${params.start}-${params.end}'});
        var table = new google.visualization.Table(document.getElementById('table_div'));
        table.draw(data, {title: 'Statistiques ${params.logType} ${params.start}-${params.end})'});
      }
    </script>
</head>
<body>
<div id="navigation">
Type d'activit&eacute; 
<g:each in="${LogType.list()}" var="t">
	<div id="address" ${t.toString()==params.logType?'class="checked"':''} style="display: inline-block;"><a href="${createLink(action:'index', params:[start:params.start, end:params.end, logType:t.toString()])}"> ${t} </a></div>		
</g:each>
de 
<g:each in="${2008..params.end.toInteger()}" var="y">
	<div id="address" ${y.toString()==params.start?'class="checked"':''} style="display: inline-block;"><a href="${createLink(action:'index', params:[logType:params.logType, start:y, end:params.end])}"> ${y} </a></div>
</g:each>
 &agrave; 
<g:each in="${params.start.toInteger()..(new Date().year+1900)}" var="y">
	<div id="address" ${y.toString()==params.end?'class="checked"':''} style="display: inline-block;"><a href="${createLink(action:'index', params:[logType:params.logType, start:params.start, end:y])}"> ${y} </a></div>
</g:each>
</div>
 <div style="margin:auto;" id="chart_div"></div>
 <div id="table_div"></div>
</body>
</html>