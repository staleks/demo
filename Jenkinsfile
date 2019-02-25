pipeline {
  agent any
  stages {
    stage('Prepare') {
      steps {
        checkout(scm: scm, poll: true, changelog: true)
        sh './gradlew clean --stacktrace'
      }
    }
    stage('Build') {
      steps {
        sh './gradlew build --stacktrace'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh './gradlew buildImage --stacktrace'
      }
    }
    stage('Upload Archives') {
      steps {
        sh './gradlew uploadArchives --stacktrace'
        script {
            if (env.BRANCH_NAME == 'master') {
                sh './gradlew pushVersionedImage --stacktrace'
            } else {
                sh './gradlew pushImage --stacktrace'
            }
        }
      }
    }
  }
}