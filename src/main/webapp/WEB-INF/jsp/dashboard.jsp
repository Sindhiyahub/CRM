<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>

<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- FontAwesome for Icons -->
<script src="https://kit.fontawesome.com/your-fontawesome-key.js"
	crossorigin="anonymous"></script>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
body {
min-height: 100vh;
	background-color: #f8f9fa;
	font-family: 'Arial', sans-serif;
}
html, body {
    height: 100%;
    margin: 0;
    display: flex;
    flex-direction: column;
}

.container {
    flex-grow: 1; 
}
.container {
	margin-top: 90px;
	width: 90%;
	max-width: 1200px;
}

.dashboard-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
}

.date-time-box {
	background: #6c757d;
	color: white;
	padding: 10px 15px;
	border-radius: 8px;
	font-weight: bold;
	text-align: center;
}

.stat-card {
	background: white;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
	transition: 0.3s ease-in-out;
	text-align: center;
	position: relative;
	overflow: hidden;
}

.stat-card:hover {
	transform: translateY(-5px);
	box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
}

.stat-icon {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 28px;
	color: white;
	position: absolute;
	top: -20px;
	left: 50%;
	transform: translateX(-50%);
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.2);
}

.bg-primary {
	background: #007bff;
}

.bg-success {
	background: #28a745;
}

.bg-warning {
	background: #ffc107;
}

.stat-label {
	font-size: 18px;
	font-weight: bold;
	margin-top: 40px;
}

.stat-value {
	font-size: 32px;
	font-weight: bold;
	margin-top: 5px;
}

.chart-container {
	width: 100%;
	max-width: 400px;
	margin: auto;
}

.chart-card {
	border-radius: 8px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
	padding: 15px;
	background-color: white;
}


.footer p {
    margin-bottom:70px;
    padding:50px;
    font-size: 19px;
}

</style>

<script>
function updateDateTime() {
    const now = new Date();
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    document.getElementById("currentDate").textContent = now.toLocaleDateString('en-US', options);
    document.getElementById("currentTime").textContent = now.toLocaleTimeString();
}
setInterval(updateDateTime, 1000);
updateDateTime();
</script>
</head>
<body>
	<jsp:include page="sidebar.jsp" />

	<div class="container">
		<div class="dashboard-header">
			<h2 class="text-dark">Dashboard</h2>
			<div class="date-time-box">
				📅 <span id="currentDate"></span> | ⏰ <span id="currentTime"></span>
			</div>
		</div>

		<div class="row text-center">
			<div class="col-md-4">
				<div class="stat-card">
					<div class="stat-icon bg-primary">
						<i class="fas fa-address-book"></i>
					</div>
					<div class="stat-label">Total Contacts</div>
					<div class="stat-value" id="totalContacts">0</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="stat-card">
					<div class="stat-icon bg-success">
						<i class="fas fa-user-plus"></i>
					</div>
					<div class="stat-label">Total Leads</div>
					<div class="stat-value" id="totalLeads">0</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="stat-card">
					<div class="stat-icon bg-warning">
						<i class="fas fa-chart-line"></i>
					</div>
					<div class="stat-label">Total Opportunities</div>
					<div class="stat-value" id="totalOpportunities">0</div>
				</div>
			</div>
		</div>


<div class="container mt-4">

    <!-- First Row: Marketing & Lead Conversion -->
    <div class="row">
         <div class="col-md-6">
            <div class="chart-card">
                <h5 class="text-center text-dark">Leads by Status</h5>
                <div class="chart-container">
                    <canvas id="leadsByStatusChart"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="chart-card">
                <h5 class="text-center text-dark">Lead Conversion Rate</h5>
                <div class="chart-container">
                    <canvas id="leadConversionChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Second Row: Leads by Status & Opportunities by Month -->
    <div class="row mt-4">
        <div class="col-md-6">
            <div class="chart-card">
                <h5 class="text-center text-dark">Opportunities by Stage</h5>
                <div class="chart-container">
                    <canvas id="opportunitiesChart"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="chart-card">
                <h5 class="text-center text-dark">Opportunities by Month</h5>
                <div class="chart-container">
                    <canvas id="opportunitiesByMonthChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Third Row: Opportunities by Stage & Cases by Status -->
    <div class="row mt-4">
       <div class="col-md-6">
            <div class="chart-card">
                <h5 class="text-center text-dark">Marketing Campaigns</h5>
                <div class="chart-container">
                    <canvas id="marketingChart"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="chart-card">
                <h5 class="text-center text-dark">Cases by Status</h5>
                <div class="chart-container">
                    <canvas id="casesByStatusChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Fourth Row: Quote Approval Rate & Revenue Forecast -->
    <div class="row mt-4">
        <div class="col-md-6">
            <div class="chart-card">
                <h5 class="text-center text-dark">Quote Approval Rate</h5>
                <div class="chart-container">
                    <canvas id="quoteApprovalChart"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="chart-card">
                <h5 class="text-center text-dark">Revenue Forecast</h5>
                <div class="chart-container">
                    <canvas id="revenueForecastChart"></canvas>
                </div>
            </div>
        </div>
    </div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
        function animateCount(element, start, end, duration) {
            let range = end - start;
            let stepTime = Math.abs(Math.floor(duration / range));
            let current = start;
            let timer = setInterval(() => {
                current += 1;
                element.textContent = current;
                if (current >= end) clearInterval(timer);
            }, stepTime);
        }

        $(document).ready(() => {
            $.getJSON("/jspapp/dashboard/totals", data => {
                animateCount(document.getElementById("totalContacts"), 0, data.totalContacts, 1500);
                animateCount(document.getElementById("totalLeads"), 0, data.totalLeads, 1500);
                animateCount(document.getElementById("totalOpportunities"), 0, data.totalOpportunities, 1500);
            });
 
            
            function createDoughnutChart(canvasId, labels, values) {
                let total = values.reduce((sum, value) => sum + value, 0); // total display

                new Chart(document.getElementById(canvasId), {
                    type: "doughnut",
                    data: {
                        labels,
                        datasets: [{
                            data: values,
                            backgroundColor: ["#088395", "#E6E9AF", "#40679E", "#1B3C73", "#FFAB5B", "#AE445A", "#E8BCB9", "#C890A7"]
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'right',
                                labels: {
                                    usePointStyle: true,
                                    pointStyle: 'circle',
                                    font: {
                                        size: 14
                                    }
                                }
                            },
                            title: {
                                display: true,
                                text: "Total " + total, 
                                font: {
                                    size: 16,
                                    weight: 'bold'
                                }
                            },
                            datalabels: {
                                color: 'black',
                                font: { size: 13 },
                                formatter: (value, ctx) => {
                                    let sum = ctx.dataset.data.reduce((a, b) => a + b, 0);
                                    let percentage = ((value / sum) * 100).toFixed(1) + "%";
                                    return percentage;
                                }
                            }
                        }
                    },
                    plugins: [ChartDataLabels]
                });
            }

           
            function createBarChart(chartId, labels, data, label, color) {
                new Chart(document.getElementById(chartId), {
                    type: "bar",
                    data: {
                        labels: labels,
                        datasets: [{
                            label: label,
                            data: data,
                            backgroundColor: color
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: { beginAtZero: true }
                        }
                    }
                });
            }
         
            $.getJSON("/jspapp/dashboard/marketing", data => {
                if (data) {
                    createDoughnutChart("marketingChart", data.map(row => row.campaignType), data.map(row => row.count));
                }
            });

          
            $.getJSON("/jspapp/dashboard/opportunities", data => {
                if (data) {
                    createDoughnutChart("opportunitiesChart", data.map(row => row.stage), data.map(row => row.count));
                }
            });

        
            $.getJSON("/jspapp/dashboard/leadConversionRate", data => {
                if (data && typeof data.conversionRate === "number") {
                    createDoughnutChart("leadConversionChart", ["Converted Leads", "Unconverted Leads"], [data.conversionRate, 100 - data.conversionRate]);
                }
            });

            $.getJSON("/jspapp/dashboard/opportunitiesValueByMonth", data => {
                if (data && data.length > 0) {
                    createDoughnutChart("opportunitiesByMonthChart", 
                        data.map(row => row.month),  
                        data.map(row => row.totalValue)  
                    );
                }
            });

            
            $.getJSON("/jspapp/dashboard/leads", data => {
                if (data) {
                    createDoughnutChart("leadsByStatusChart", data.map(row => row.status), data.map(row => row.count));
                }
            });
        
            $.getJSON("/jspapp/dashboard/casesByStatus", data => {
                if (data) {
                	createDoughnutChart("casesByStatusChart", 
                        data.map(row => row.status), 
                        data.map(row => row.count)  
                    );
                }
            }); 
            
            $.getJSON("/jspapp/dashboard/quoteApprovalRate", data => {
                if (data && typeof data.approved === "number" && typeof data.pending === "number") {
                	createDoughnutChart("quoteApprovalChart", ["Approved", "Pending"], [data.approved, data.pending]);
                }
            });

     
            $.getJSON("/jspapp/dashboard/revenueForecast", data => {
                if (data) {
                	createDoughnutChart("revenueForecastChart", 
                        data.map(row => row.month),  
                        data.map(row => row.revenue), 
                       
                    );
                }
            });

    	    	    
        });
    </script>
    

    <footer class="footer">
        <div class="container text-center">
            <p class="mb-0">© 2025 SAT CRM. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
