environment = ''
suite = ''

pipeline {
  agent 'any'
  stages {
    stage('Test') {                     
      steps {
        script {
          switch(env.JOB_NAME) {
            case "Pipeline - Tests HMG - Search Flow":
              environment = 'hmg'  
              suite = '@search_product'
            break
          }
        }

          sh "mkdir -p target"
          sh "cucumber --tags ${suite} -p ${environment} -p format_json -p format_html"
      }      
    }
  }

  post {
    always {
      cucumber buildStatus: "UNSTABLE",
      fileIncludePattern: "**/*report.json",
      jsonReportDirectory: 'target'      

      emailext mimeType: 'text/html', 
      attachmentsPattern: 'target/report.html', 
      body: 'Link report: ${BUILD_URL}cucumber-html-reports/overview-features.html <br /> <br /> Link build ${BUILD_URL}', 
      subject: '$PROJECT_NAME - $BUILD_STATUS' 
    }
  }
}