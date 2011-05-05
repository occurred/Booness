<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
 <script type="text/javascript" src="${resource(dir:'plugins/extjs4-4.0.0.0/ext', file: 'bootstrap.js')}"></script>
  <script type="text/javascript" src="http://dev.sencha.com/deploy/ext-4.0.0/examples/example-data.js"></script> 
  
  <script type="text/javascript">
  Ext.require('Ext.chart.*');
Ext.require('Ext.layout.container.Fit');

Ext.onReady(function () {
	store1.loadData(generateData(6, 20));
    Ext.create('Ext.chart.Chart', {
        renderTo: Ext.get('chart'),
        width: 500,
        height: 300,
        animate: true,
        store: store1,
        id: 'chartCmp',
        legend: true,
        theme: 'Base:gradients',
        series: [{
            type: 'pie',
            field: 'data1',
            showInLegend: true,
            donut:35,
            tips: {
              trackMouse: true,
              width: 140,
              height: 28,
              renderer: function(storeItem, item) {
                //calculate and display percentage on hover
                var total = 0;
                store1.each(function(rec) {
                    total += rec.get('data1');
                });
                this.setTitle(storeItem.get('name') + ': ' + Math.round(storeItem.get('data1') / total * 100) + '%');
              }
            },
            highlight: {
              segment: {
                margin: 20
              }
            },
            label: {
                field: 'name',
                display: 'rotate',
                contrast: true,
                font: '12px Arial'
            }
        }]    
    });
});
   </script>
</head>
<body>
  <div class="body">
  <button onclick="var chart = Ext.getCmp('chartCmp');store1.loadData(generateData(6, 20));chart.refresh();">   test   </button>
  <div id="chart"></div>
  </div>
</body>
</html>