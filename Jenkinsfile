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
    stage('Upload Archives') {
      steps {
        sh './gradlew uploadArchives --stacktrace'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh './gradlew buildImage --stacktrace'
      }
    }
  }
}